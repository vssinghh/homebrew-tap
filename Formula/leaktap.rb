class Leaktap < Formula
  desc "Offline secret, MCP & plugin auditor, terminal UI, and live wiretap for AI coding CLIs"
  homepage "https://github.com/vssinghh/leaktap"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vssinghh/leaktap/releases/download/v0.4.2/leaktap-darwin-arm64", using: :nounzip
      sha256 "3c39675493e84d3c82972025bc94569c5c3ac3bdbf593d6f410cb047236c7454"
    end

    on_intel do
      url "https://github.com/vssinghh/leaktap/releases/download/v0.4.2/leaktap-darwin-x64", using: :nounzip
      sha256 "3effce5ff1078a4b4c086c8018b1855c3440a8f0f24cfa3260583afabd9b8125"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vssinghh/leaktap/releases/download/v0.4.2/leaktap-linux-arm64", using: :nounzip
      sha256 "ce3d67633a1536a18ae623b5eacb1577b114ef16eb94cb496b7c4728034d54c5"
    end

    on_intel do
      url "https://github.com/vssinghh/leaktap/releases/download/v0.4.2/leaktap-linux-x64", using: :nounzip
      sha256 "ca65fd2a81ee7a089104324f29809046615097e3925af3d748177e7b90636849"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "leaktap-darwin-arm64" : "leaktap-darwin-x64"
    else
      Hardware::CPU.arm? ? "leaktap-linux-arm64" : "leaktap-linux-x64"
    end
    bin.install binary => "leaktap"
  end

  test do
    assert_match "leaktap #{version}", shell_output("#{bin}/leaktap --version")
  end
end
