class Cv < Formula
  desc "Convert big videos (MKV/MP4 remux, compress, trim, join) and photos on macOS"
  homepage "https://github.com/touchfalls/cv"
  url "https://github.com/touchfalls/cv/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b0aa6c47e2c58e555af207230062ab5d99073f78194012c660d2748363875d37"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on :macos
  depends_on "webp"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cv -version")
  end
end
