Facter.add(:yum_excludes) do
  setcode do
    rpm_result = Facter::Core::Execution.exec("grep ^exclude /etc/yum.conf | awk -F '=' '{print $2}'")
    rpm_result.split(" ")
  end
end
