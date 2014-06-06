module Inaho
	class Entry
		attr_accessor :id, :title, :yomi, :body, :index

		# Create new Entry object.
		#
		# options - Optional Symbol-keyed Hash:
		# 	 				:id - Optional id if you dont want the generated one.
		# 	 				:title - Title for the Dictionary Entry.
		#  					:index - Array of strings to index the Entry.
		#  					:body - Html body for the Dictionary Entry.
		#  					:yomi - Alternative reading field for foreign alphabets.
		# 	 								See Apple's Docs for more info.
		#
		# Returns an instance of Inaho::Dictionary.
		def initialize(options = {})
			options.each { |k, v| instance_variable_set("@#{k}", v) }
			@index ||= []
		end

		# Add string to index array.
		#
		# Returns index Array.
		def add_index(value)
			@index << value.to_s
			return @index
		end

		# Generates xml for the Entry object.
		#
		# Returns String.
		def to_xml
			return nil if title.nil? || body.nil?

			xml = ""
			xml << "<d:entry id=\"#{self.id}\" d:title=\"#{self.title}\">\n"
			@index.each do |i|
				xml << "\t<d:index d:value=\"#{i}\" d:title=\"#{title}\" "
				xml << "d:yomi=\"#{yomi}\"" if !self.yomi.nil?
				xml << "/>\n"
			end
			xml << "\t<div>\n"
			xml << "\t\t#{@body}\n"
			xml << "\t</div>\n"
			xml << "</d:entry>\n"

			return xml
		end
	end
end
