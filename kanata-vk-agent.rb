class KanataVkAgent < Formula
  desc "Control kanata virtual keys to enable apps and input source aware key mapping"
  homepage "https://github.com/devsunb/kanata-vk-agent"
  license "GPL-3.0-or-later"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/devsunb/kanata-vk-agent/releases/download/v0.1.0/kanata-vk-agent_x86_64.tar.gz"
      sha256 "8c628a19b61720462fd5620fb27d281fe8ef9e2f72065fc469c6028ae707b4e4"
    else
      url "https://github.com/devsunb/kanata-vk-agent/releases/download/v0.1.0/kanata-vk-agent_aarch64.tar.gz"
      sha256 "56e9b8e582552ce2fe05aafdfef1566c35b3b283650a36e98ae18e793af5a589"
    end
  end

  head "https://github.com/devsunb/kanata-vk-agent.git", branch: "main"
  head do
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "kanata-vk-agent"
    end
  end

  test do
    assert_match "kanata-vk-agent #{version}", shell_output("#{bin}/kanata-vk-agent -V")
  end
end
