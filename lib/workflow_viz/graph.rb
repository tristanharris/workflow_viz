module WorkflowViz::Graph

	def self.draw(role, tracker)
		rules = role == :all ? WorkflowTransition : role.workflow_rules
		rules = rules.where(:tracker_id => tracker) unless tracker == :all
		GraphViz::new( :G, :type => :digraph ) do |graph|
			node = Hash.new { |h,k| h[k] = graph.add_nodes(IssueStatus.find(k).to_s) }
			rules.map do |transition|
				[transition.old_status_id, transition.new_status_id]
			end.uniq.each do |old_id, new_id|
				graph.add_edges(node[old_id], node[new_id])
			end
		end.output :svg => String
	end

end
