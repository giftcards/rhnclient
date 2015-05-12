Facter.add(:rpm_pubkeys) do
  setcode do
    rpm_result = Facter::Core::Execution.exec('rpm -q gpg-pubkey')
    rpm_result.split("\n")
  end
end
