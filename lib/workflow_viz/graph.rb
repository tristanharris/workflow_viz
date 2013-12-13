module WorkflowViz::Graph

	def self.draw(role, tracker)
		GraphViz::new( :G, :type => :digraph ) do |graph|
			node = Hash.new { |h,k| h[k] = graph.add_nodes(IssueStatus.find(k).to_s) }
			role.workflow_rules.where(:tracker_id => tracker).each do |transition|
				graph.add_edges(node[transition.old_status_id], node[transition.new_status_id])
			end
		end.output :svg => String
	end

end
