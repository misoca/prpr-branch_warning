module Prpr
  module Action
    module BranchWarning
      class AddLabel < Base
        def call
          if default_branch?
            remove_label
          else
            add_label
          end
        end

        private

        def default_branch?
          event.pull_request.base.ref == event.repository.default_branch
        end

        def label
          env[:branch_warning_label] || 'branch-warning'
        end

        def add_label
          return if already_labeled?(label)
          github.add_labels_to_an_issue(repository_name, pull_request_number, [label])
        end

        def remove_label
          return unless already_labeled?(label)
          github.remove_label(repository_name, pull_request_number, label)
        end

        def already_labeled?(label)
          event.pull_request.labels.map(&:name).any? { |name| name == label }
        end

        def repository_name
          event.repository.full_name
        end

        def pull_request_number
          event.pull_request.number
        end

        def github
          Repository::Github.default
        end
      end
    end
  end
end
