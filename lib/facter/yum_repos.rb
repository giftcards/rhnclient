Facter.add(:yum_repos) do
  setcode do
    repo_result = Dir.glob('/etc/yum.repos.d/*.repo')
    repo_result
  end
end
