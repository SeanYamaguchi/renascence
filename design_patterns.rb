require 'webrick'

class Report
	def initialize
		@title = 'Monthly Report'
		@text = ['Things are going','really, really well.']
	end

	def output_report
		output_start
		output_head
		output_body_start
		output_body
		output_body_end
		output_end
	end

	def output_body
		@text.each do |line|
			output_line(line)
		end
	end

	def output_start
	end

	def output_head
		output_line(@title)
	end

	def output_body_start
	end

	def output_line(line)
		raise "Called abstract method: output_line"
	end

	def output_body_end
	end

	def output_end
	end
end

class HTMLReport < Report
	def output_start
		puts('<html>')
	end

	def output_head
		puts('    <head>')
		puts("	  <title>#{@title}</title>")
		puts('    <head>')
	end

	def output_body_start
		puts('<body>')
	end

	def output_line(line)
		puts("    <p>#{line}</p>")
	end

	def output_body_end
		puts('</body>')
	end

	def output_end
		puts('</html>')
	end
end

class PlainTextReport < Report
	def output_start
	end

	def output_head
		puts("****#{@title}****")
		puts
	end

	def output_body_start
	end

	def output_line(line)
		puts(line)
	end

	def output_body_end
	end

	def output_end
	end
end

report = HTMLReport.new
report.output_report

public boolean isEmpty(String s)
{
	return s.length() == 0;
}

def empty?(s)
	s.length == 0
end

require 'test/unit'
require 'empty'

class EmptyTest < Test::Unit::TestCase
	def setup
		@empty_string = ''
		@one_char_string = 'X'
		@long_string = "The rain in Spain"
		@empty_array = []
		@one_element_array = [1]
		@long_array = [1,2,3,4,5,6]
	end

	def test_empty_on_strings
		assert empty?(@empty_string)
		assert ! empty?(@one_char_string)
		assert ! empty?(@long_string)
	end

	def test_empty_on_arrays
		assert empty?(@empty_array)
		assert ! empty?(@one_element_array)
		assert ! empty?(@long_array)
	end
end

class HelloServer < WEBrick::GenerisServer
	def run(socket)
		socket.print("Hello TCP/IP world")
	end
end
