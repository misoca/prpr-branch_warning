module Prpr
  module Handler
    class BranchWarning < Base
      handle Event::PullRequest, action: /opened|edited/ do
        Prpr::Action::BranchWarning::AddLabel.new(event).call
      end
    end
  end
end
