require 'nokogiri'

module Inaho
	class Dictionary
		# Create new Dictionary object.
    #
    # options - Optional Symbol-keyed Hash:
    # 	 				:entries - Array of Inaho::Entry Objects
		#
		# Returns an instance of Inaho::Dictionary.
		def initialize(options = {})
			options.each { |k, v| instance_variable_set("@#{k}", v) }
			@entries ||= []
		end

		# Add Entry Object to entries Array.
		#
		def <<(entry)
			@entries << entry if entry.kind_of?(Inaho::Entry)
		end

		# Provide access to entries Array.
    #
    # Returns Array.
		def entries
			return Array(@entries)
		end

		# Validate Dictionary xml with Apple's RelaxNG schema.
    #
    # Returns true if xml is valid.
    # Returns List of Nokogiri::XML::SyntaxError objects if xml is not valid.
		def validate
			errors = []
			schema_path = File.expand_path("../../../vendor/AppleDictionarySchema.rng", __FILE__)

			schema = Nokogiri::XML::RelaxNG(File.open(schema_path))
			schema.validate(Nokogiri::XML(self.to_xml)).each do |error|
				errors << error
			end

			if errors.size > 0
				return errors
			else
				return true
			end
		end

		# Generates xml for Dictionary and Entry objects.
		#
		# Returns String.
		def to_xml
			xml = ""
			xml << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
			xml << "<d:dictionary xmlns=\"http://www.w3.org/1999/xhtml\" "
			xml << "xmlns:d=\"http://www.apple.com/DTDs/DictionaryService-1.0.rng\">\n"
			@entries.each do |entry|
				next if entry.to_xml.nil?

				xml << entry.to_xml
			end
			xml << "</d:dictionary>"

			return xml
		end

	end
end
