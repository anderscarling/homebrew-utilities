class LibcoapWithUtils < Formula
  desc "Lightweight application-protocol for resource-constrained devices"
  homepage "https://github.com/obgm/libcoap"
  url "https://github.com/obgm/libcoap/archive/v4.2.1.tar.gz"
  sha256 "29a0394a265d3febee41e5e2dc03d34292a0aede37f5f80334e529ac0dab2321"
  license "BSD-2-Clause"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "doxygen" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl@1.1" if MacOS.version <= :sierra

  conflicts_with "libcoap", :because => "both provides libcoap"

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}",
                          "--disable-manpages"
    system "make"
    system "make install"
  end
end
