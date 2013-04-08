require 'formula'

class Cgminer < Formula
  homepage 'https://github.com/ckolivas/cgminer'
  url 'https://github.com/ckolivas/cgminer/archive/v2.11.4.tar.gz'
  sha1 '6912034c78491044ef1f33bd4d04dc99f422cd75'

  depends_on 'automake' => :build
  depends_on 'curl' => :build
  depends_on 'c-ares' => :build
  depends_on 'pkg-config' => :build

  depends_on 'libusb'

  def install
    ENV['NOCONFIGURE'] = '1'

    system "./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--enable-cpumining"
    system "make install"
  end
end
