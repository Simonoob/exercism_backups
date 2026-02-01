# REQUIRED DEPENDENCY: gh CLI

module PrMerger
  def self.pr_ids
    p 'getting open PRs IDs'
    ids = `gh pr list --state open | grep -o ^[0-9].`.strip.split("\n", -1).map { |id| id.to_i }
    p "found #{ids.length} open PRs"
    ids
  end

  def self.merge_open_prs
    merged = []

    pr_ids.each do |id|
      `gh pr merge -s -d #{id}`
      merged << id
      p "PR ##{id} merged"
    end
    p "merged #{merged.length} open PRs"
  end
end

PrMerger.merge_open_prs
