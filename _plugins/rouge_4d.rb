# frozen_string_literal: true

require 'rouge'

module Rouge
  module Lexers
    class FourD < RegexLexer
      title "4D"
      desc "4D / 4D programming language"
      tag '4d'
      aliases '4d', '4dm', 'c4d'
      filenames '*.4d', '*.4dm', '*.c4d'

      # Multi-word keywords first
      MULTI_KEYWORDS = [
        "end try", "end use", "fin utiliser", "begin sql", "debut sql",
        "end sql", "fin sql", "case of", "au cas ou", "end case", "fin de cas",
        "fin de si", "fin de boucle", "end while", "fin tant que",
        "pour chaque", "end for each", "end for", "for each", "end if", "fin de chaque", "class extends", "end defer", "end lamda"
      ]

      # Single-word keywords
      SINGLE_KEYWORDS = %w(
        utiliser use var property try catch return break continue if si else sinon boucle repeat repeter until jusque while tant que for alias defer lamda
      )

      # Built-in constants
      CONSTANTS = %w(True False Null)

      state :root do
        #
        # CONSTANTS
        #
        # Block comment
        rule %r/\/\*.*?\*\//m, Comment::Multiline
        # Single-line comments
        rule %r/\/\/.*$/, Comment::Single
        #
        # STRINGS
        #
        # String constants
        rule %r/"/, Str::Double, :string
        #
        # NUMBERS
        #
        # Hex
        rule %r/(?<![\w])0[xX][0-9a-fA-F]+\b/, Num::Hex
        # Dec
        rule %r/(?<![\w])[0-9]+(?:[.,][0-9]+)?(?:[eE]-?[0-9]+)?\b/, Num::Float
        # Int
        rule %r/(?<![\w])[0-9]+\b/, Num::Integer
        #
        # TIME AND DATE
        #
        # Time
        rule %r/(?<![\w])[?][0-9]{2}:[0-9]{2}:[0-9]{2}[?]\b/, Name::Constant
        # Date
        rule %r/(?<![\w])[!][0-9]{2,4}-[0-9]{2}-[0-9]{2}[!]\b/, Name::Constant
        #
        # PREFIX:$
        #
        # Numbered parameters
        rule %r/(?<![\w])[$][0-9]+\b/, Name::Variable
        # Local variables and named parameters
        rule %r/(?<![\w])[$][\p{L}_]+[\p{L}_0-9]*/, Name::Variable
        #
        # PREFIX:<>
        #
        # Interprocess variables
        rule %r/(?<![\w])<>[\p{L}_]+[\p{L}_0-9]*/, Name::Variable
        #
        # Language constants
        rule %r/(?<!\w)(\p{L})([\p{L} 0-9]+)(\p{L})(?=(:K[0-9]+:[0-9]+))\b/, Name::Variable
        #
        # KEYWORDS (BASIC)
        #
        # Multi
        rule %r/(?i)\b(error formula|error line|error method)\b/, Keyword::Reserved
        # Single
        rule %r/(?i)\b(document|ok|recdelimit|flddelimit|modifiers|keycode|mousex|mousey|mouseproc|mousedown|error)\b/, Keyword::Reserved
        #
        # KEYWORDS (ADDITIONAL)
        #
        # Multi
        rule %r/(?i)\b(?:#{MULTI_KEYWORDS.map { |k| Regexp.escape(k) }.join('|')})\b/, Keyword::Reserved
        # Single
        rule %r/(?i)\b(?:#{SINGLE_KEYWORDS.join('|')})\b/, Keyword::Reserved
        #
        # Classic command
        rule %r/(?<!\w)([\p{L}])([\p{L} 0-9]*)([\p{L}])(?=(:C[0-9]+))\b/, Name::Function
        #
        # Classic command special (more keyword than function)
        rule %r/(?<!\w)(?i)(super|this|form|null|4d|ds|cs)(?=(:C[0-9]+)?)\b/, Keyword::Reserved
        #
        # Special keyword
        rule %r/(?<!\w)(?i)(#DECLARE)\b/, Keyword::Reserved
        #
        # Special Sequence 1
        rule %r/\b(?i)(local |exposed |shared )*(function )([\p{L}]+ )?([\p{L}]+)\b/, Name::Function
        # Special Sequence 2
        rule %r/\b(?i)(local |exposed |shared )*(event )([\p{L}]+ )?([\p{L}]+)\b/, Name::Function
        # Special Sequence 3
        rule %r/\b(?i)(singleton |shared )*(class constructor)\b/, Name::Function
        #
        # OBJECT NOTATION
        #
        # Dot notation functions
        rule %r/(?<=\.)([\p{L}])([\p{L}0-9]*)(?=\()/, Name::Function
        # Dot notation attributes
        rule %r/(?<=\.)([\p{L}])([\p{L}0-9]*)(?=\.|\()\b/, Name::Attribute
        #
        # 4D operators
        #
        rule %r/(\+=|-=|\*=|\/=|~\||&&|&|\|\||\||<<|>>|<=|>=|<|>|:=|\?\?|\?\+|\?\-|\+|\-|\*|\/|=|#|\\\^|%|\?|:)/, Operator
        #
        # Generic identifiers (Unicode)
        rule %r/\b([\p{L}])([\p{L}0-9]*)\b/, Name
        #
      end
      
      # String state for escape sequences
      state :string do
        rule %r/\\["ntr\\]/, Str::Escape
        rule %r/"/, Str::Double, :pop!
        rule %r/[^\\"]+/, Str::Double
        rule %r/\\/, Str::Escape
      end
    end
  end
end

