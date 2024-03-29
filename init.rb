Redmine::Plugin.register :workflow_viz do
  name 'Workflow Viz'
  author 'Tristan Harris'
  description 'Show vizualizations of workflow'
  version '0.0.1'
  url ''
end

Rails.configuration.to_prepare do
  ApplicationController.send(:helper, WorkflowViz::ViewHelper)
end
