# encoding: utf-8
task default: [:install]

task :install do
  root_dir = ENV['HOME'] + '/.zprezto'
  FileUtils.ln_s File.join(Dir.pwd), root_dir unless File.exists? root_dir

  Dir.chdir(root_dir + '/runcoms')
  Dir.glob('z*') do |f|
    dotfile = File.join(ENV['HOME'], ".#{f}")
    if File.exists? dotfile
      puts "#{dotfile} already exists!"
    else
      FileUtils.ln_s File.join(Dir.pwd, f), dotfile
    end
  end
end

task :purge do
  deleted_files = ''

  Dir.glob("#{ENV['HOME']}/.z*").each do |f|
    unless f.match /.zhistory|.zlocalrc/
      FileUtils.rm_r f
      deleted_files << "- #{f}\n"
    end
  end

  puts "Files deleted:\n#{deleted_files}\n" unless deleted_files.empty?
  puts "Files preserved:\n- #{ENV['HOME']}/.zhistory\n- #{ENV['HOME']}/.zlocalrc\n\n"
end
