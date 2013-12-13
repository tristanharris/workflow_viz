module WorkflowViz::WorkflowControllerPatch

  def self.included(base)
    base.class_eval do
      alias_method_chain :edit, :workflow_viz
		end
  end

	def edit_with_workflow_viz
		edit_without_workflow_viz
		render :edit_viz
	end

end

