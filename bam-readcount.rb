require 'formula'

class BamReadcount < Formula
  homepage 'https://github.com/genome/bam-readcount'
  url 'https://github.com/genome/bam-readcount.git', :tag => 'v0.4.5'

  head 'https://github.com/genome/bam-readcount.git'

  depends_on 'cmake' => :build
  depends_on 'samtools-0.1'

  def install
    samtools = Formula["samtools-0.1"].opt_prefix
    ENV['SAMTOOLS_ROOT'] = "#{samtools-0.1}:#{samtools-0.1}/include/bam"
    system 'cmake', '.', *std_cmake_args
    system 'make'
    bin.install 'bin/bam-readcount'
  end

  test do
    system 'bam-readcount 2>&1 |grep -q bam-readcount'
  end
end
