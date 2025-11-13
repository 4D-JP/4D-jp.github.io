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
        rule %r/"/, Literal::String, :string
        #
        # NUMBERS
        #
        # Hex
        rule %r/(?<![\w])0[xX][0-9a-fA-F]+\b/, Literal::Number::Hex
        # Dec
        rule %r/(?<![\w])[0-9]+(?:[.,][0-9]+)?(?:[eE]-?[0-9]+)?\b/, Literal::Number::Float
        # Int
        rule %r/(?<![\w])[0-9]+\b/, Literal::Number::Integer
        #
        # TIME AND DATE
        #
        # Time
        rule %r/(?<![\w])[?][0-9]{2}:[0-9]{2}:[0-9]{2}[?]\b/, Literal
        # Date
        rule %r/(?<![\w])[!][0-9]{2,4}-[0-9]{2}-[0-9]{2}[!]\b/, Literal
        #
        # PREFIX:$
        #
        # Numbered parameters
        rule %r/(?<![\w])[$][0-9]+\b/, Name::Variable::Instance
        # Local variables and named parameters
        rule %r/(?<![\w])[$][\p{L}_]+[\p{L}_0-9]*/, Name::Variable
        #
        # PREFIX:<>
        #
        # Interprocess variables
        rule %r/(?<![\w])<>[\p{L}_]+[\p{L}_0-9]*/, Name::Variable::Global
        #
        # Tokenised constants
        rule %r/(?<!\w)(\p{L})([\p{L} 0-9]+)(\p{L})(?=(:K[0-9]+:[0-9]+))\b/, Name::Constant
        #
        # Tokenised commands
        rule %r/(?<!\w)([\p{L}])([\p{L} 0-9]*)([\p{L}])(?=(:C[0-9]+))\b/, Name::Function
        #
        # INSERT COMMANDS HERE
        rule %r/(?i)\b(?:#{COMMAND_ENGLISH.map { |k| Regexp.escape(k) }.join('|')})\b/, Name::Builtin
        #
        rule %r/(?i)\b(?:#{COMMAND_FRENCH.map { |k| Regexp.escape(k) }.join('|')})\b/, Name::Builtin
        #
        # KEYWORDS (system variables)
        #
        # Multi
        rule %r/(?i)\b(error formula|error line|error method)\b/, Name::Builtin::Pseudo
        # Single
        rule %r/(?i)\b(document|ok|recdelimit|flddelimit|modifiers|keycode|mousex|mousey|mouseproc|mousedown|error)\b/, Name::Builtin::Pseudo
        #
        # KEYWORDS (control flow)
        #
        # Multi
        rule %r/(?i)\b(?:#{MULTI_KEYWORDS.map { |k| Regexp.escape(k) }.join('|')})\b/, Keyword::Reserved
        # Single
        rule %r/(?i)\b(?:#{SINGLE_KEYWORDS.join('|')})\b/, Keyword::Reserved
        #
        # Special Sequence 0
        rule %r/(?<!\w)(?i)(#DECLARE)\b/, Keyword::Declaration
        # Special Sequence 1
        rule %r/\b(?i)(local |exposed |shared )*(function )([\p{L}]+ )?([\p{L}]+)\b/, Keyword::Declaration
        # Special Sequence 2
        rule %r/\b(?i)(local |exposed |shared )*(event )([\p{L}]+ )?([\p{L}]+)\b/, Keyword::Declaration
        # Special Sequence 3
        rule %r/\b(?i)(singleton |shared )*(class constructor)\b/, Keyword::Declaration
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
        rule %r/\\["ntr\\]/, Literal::String::Escape
        rule %r/"/, Literal::String, :pop!
        rule %r/[^\\"]+/, Literal::String::Escape
        rule %r/\\/, Literal::String::Escape
      end
    end
  end
end

