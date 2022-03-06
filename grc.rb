#!/usr/bin/env ruby
# frozen_string_literal: false

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# Methods
# grc?
# no_downcase_diacritics
# no_upcase_diacritics
# no_diacritics
# transliterate
# oxia_to_tonos
# tonos_to_oxia
# acute_to_grave
# grave_to_acute

# String Methods for Ancient Greek
class String
  def grc?
    !scan(/(\p{Greek})/).empty?
  end

  def no_downcase_diacritics
    tr('ἀἄᾄἂᾂἆᾆᾀἁἅᾅἃᾃἇᾇᾁάάᾴὰᾲᾰᾶᾷᾱᾳἐἔἒἑἕἓέέὲἠἤᾔἢᾒἦᾖᾐἡἥᾕἣᾓἧᾗᾑήήῄὴῂῆῇῃἰἴἲἶἱἵἳἷίίὶῐῖϊϊΐῒῗῑὀὄὂὁὅὃόόὸῤῥὐὔὒὖὑὕὓὗύύὺῠῦϋΰΰΰῢῧῡὠὤᾤὢᾢὦᾦᾠὡὥᾥὣᾣὧᾧᾡώώῴὼῲῶῷῳ',
        'ααααααααααααααααααααααααααεεεεεεεεεηηηηηηηηηηηηηηηηηηηηηηηηιιιιιιιιιιιιιιιιιιιοοοοοοοοορρυυυυυυυυυυυυυυυυυυυυωωωωωωωωωωωωωωωωωωωωωωωω')
  end

  def no_upcase_diacritics
    tr('ἈἌἌΙἊἊΙἎἎΙἈΙἉἍἍΙἋἋΙἏἏΙἉΙΆΆΆΙᾺᾺΙᾸΑ͂Α͂ΙᾹΑΙἘἜἚἙἝἛΈΈῈἨἬἬΙἪἪΙἮἮΙἨΙἩἭἭΙἫἫΙἯἯΙἩΙΉΉΉΙῊῊΙΗ͂Η͂ΙΗΙἸἼἺἾἹἽἻἿΊΊῚῘΙ͂ΪΪΪ́Ϊ̀Ϊ͂ῙὈὌὊὉὍὋΌΌῸΡ̓ῬΥ̓Υ̓́Υ̓̀Υ̓͂ὙὝὛὟΎΎῪῨΥ͂ΫΫ́Ϋ́Ϋ́Ϋ̀Ϋ͂ῩὨὬὬΙὪὪΙὮὮΙὨΙὩὭὭΙὫὫΙὯὯΙὩΙΏΏΏΙῺῺΙΩ͂Ω͂ΙΩΙ',
        'ΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΕΕΕΕΕΕΕΕΕΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΟΟΟΟΟΟΟΟΟΡΡΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩ')
  end

  def no_diacritics
    tr('ἀἄᾄἂᾂἆᾆᾀἁἅᾅἃᾃἇᾇᾁάάᾴὰᾲᾰᾶᾷᾱᾳἐἔἒἑἕἓέέὲἠἤᾔἢᾒἦᾖᾐἡἥᾕἣᾓἧᾗᾑήήῄὴῂῆῇῃἰἴἲἶἱἵἳἷίίὶῐῖϊϊΐῒῗῑὀὄὂὁὅὃόόὸῤῥὐὔὒὖὑὕὓὗύύὺῠῦϋΰΰΰῢῧῡὠὤᾤὢᾢὦᾦᾠὡὥᾥὣᾣὧᾧᾡώώῴὼῲῶῷῳἈἌἌΙἊἊΙἎἎΙἈΙἉἍἍΙἋἋΙἏἏΙἉΙΆΆΆΙᾺᾺΙᾸΑ͂Α͂ΙᾹΑΙἘἜἚἙἝἛΈΈῈἨἬἬΙἪἪΙἮἮΙἨΙἩἭἭΙἫἫΙἯἯΙἩΙΉΉΉΙῊῊΙΗ͂Η͂ΙΗΙἸἼἺἾἹἽἻἿΊΊῚῘΙ͂ΪΪΪ́Ϊ̀Ϊ͂ῙὈὌὊὉὍὋΌΌῸΡ̓ῬΥ̓Υ̓́Υ̓̀Υ̓͂ὙὝὛὟΎΎῪῨΥ͂ΫΫ́Ϋ́Ϋ́Ϋ̀Ϋ͂ῩὨὬὬΙὪὪΙὮὮΙὨΙὩὭὭΙὫὫΙὯὯΙὩΙΏΏΏΙῺῺΙΩ͂Ω͂ΙΩΙ',
        'ααααααααααααααααααααααααααεεεεεεεεεηηηηηηηηηηηηηηηηηηηηηηηηιιιιιιιιιιιιιιιιιιιοοοοοοοοορρυυυυυυυυυυυυυυυυυυυυωωωωωωωωωωωωωωωωωωωωωωωωΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΑΕΕΕΕΕΕΕΕΕΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΗΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΙΟΟΟΟΟΟΟΟΟΡΡΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΥΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩ')
  end

  def tonos_to_oxia
    tr('ΆΈΉΊΎΌΏάέήίΐύΰόώ',
       'ΆΈΉΊΎΌΏάέήίΐύΰόώ')
  end

  def oxia_to_tonos
    tr('ΆΈΉΊΎΌΏάέήίΐύΰόώ',
       'ΆΈΉΊΎΌΏάέήίΐύΰόώ')
  end

  def acute_to_grave
    tr('ἄᾄἅᾅάάᾴἔἕέέἤᾔἥᾕήήῄἴἵίίΐὄὅόόὔὕύύΰΰὤᾤὥᾥώῴ',
       'ἂᾂἃᾃὰὰᾲἒἓὲὲἢᾒἣᾓὴὴῂἲἳὶὶῒὂὃὸὸὒὓὺὺῢῢὢᾢὣᾣὼῲ')
  end

  def grave_to_acute
    tr('ἂᾂἃᾃὰὰᾲἒἓὲὲἢᾒἣᾓὴὴῂἲἳὶὶῒὂὃὸὸὒὓὺὺῢῢὢᾢὣᾣὼῲ',
       'ἄᾄἅᾅάάᾴἔἕέέἤᾔἥᾕήήῄἴἵίίΐὄὅόόὔὕύύΰΰὤᾤὥᾥώῴ')
  end

  def transliterate
    return "ERROR: String doesn't contain any greek. Summon the muse and try again." unless grc?

    result = []
    split.map! do |word|
      esp_rude = word.to_s =~ /[ἁἅᾅἃᾃἇᾇᾁἑἕἓἡἥᾕἣᾓἧᾗᾑἱἵἳἷὁὅὃὑὕὓὗὡὥᾥὣᾣὧᾧᾡ]/ ? "h" : ""
      rho = word.to_s =~ /ῥ/ ? "rh" : ""
      partial_trans = word.gsub(/ῥ/,'').no_diacritics.to_s.gsub('Ͱ', '').gsub('ͱ', '').gsub('Ͳ', '').gsub('ͳ', '').gsub('ʹ', '').gsub(/\u0375/, '').gsub('Ͷ', '').gsub('ͷ', '').gsub('ͺ', '').gsub('ͻ', '').gsub('ͼ', '').gsub('ͽ', '').gsub('Α', 'a').gsub('Β', 'b').gsub('Γ', 'g').gsub('Δ', 'd').gsub('Ε', 'e').gsub('Ζ', 'z').gsub('Η', 'ē').gsub('Θ', 'th').gsub('Ι', 'i').gsub('Κ', 'k').gsub('Λ', 'l').gsub('Μ', 'm').gsub('Ν', 'n').gsub('Ξ', 'x').gsub('Ο', 'o').gsub('Π', 'p').gsub('Ρ', 'r').gsub('Σ', 's').gsub('Τ', 't').gsub('Υ', 'y').gsub('Φ', 'ph').gsub('Χ', 'ch').gsub('Ψ', 'ps').gsub('Ω', 'ō').gsub('α', 'a').gsub('β', 'b').gsub('γ', 'g').gsub('δ', 'd').gsub('ε', 'e').gsub('ζ', 'z').gsub('η', 'ē').gsub('θ', 'th').gsub('ι', 'i').gsub('κ', 'k').gsub('λ', 'l').gsub('μ', 'm').gsub('ν', 'n').gsub('ξ', 'x').gsub('ο', 'o').gsub('π', 'p').gsub('ρ', 'r').gsub('ς', 's').gsub('σ', 's').gsub('τ', 't').gsub('υ', 'y').gsub('φ', 'ph').gsub('χ', 'ch').gsub('ψ', 'ps').gsub('ω', 'ō').gsub('Ϗ', '').gsub('ϐ', '').gsub('ϑ', '').gsub('ϒ', '').gsub('ϓ', '').gsub('ϔ', '').gsub('ϕ', '').gsub('ϖ', '').gsub('ϗ', '').gsub('Ϙ', '').gsub('ϙ', '').gsub('Ϛ', '').gsub('ϛ', '').gsub('Ϝ', '').gsub('ϝ', '').gsub('Ϟ', '').gsub('ϟ', '').gsub('Ϡ', '').gsub('ϡ', '').gsub('Ϣ', '').gsub('ϣ', '').gsub('Ϥ', '').gsub('ϥ', '').gsub('Ϧ', '').gsub('ϧ', '').gsub('Ϩ', '').gsub('ϩ', '').gsub('Ϫ', '').gsub('ϫ', '').gsub('Ϭ', '').gsub('ϭ', '').gsub('Ϯ', '').gsub('ϯ', '').gsub('ϰ', '').gsub('ϱ', '').gsub('ϲ', '').gsub('ϳ', '').gsub('ϴ', '').gsub('ϵ', '').gsub(/\u03F6/, '').gsub('Ϸ', '').gsub('ϸ', '').gsub('Ϲ', '').gsub('Ϻ', '').gsub('ϻ', '').gsub('ϼ', '').gsub('Ͻ', '').gsub('Ͼ', '').gsub('Ͽ', '').gsub('gg', 'ng').gsub('gk', 'nk').gsub('gx', 'nx').gsub('gc', 'nc').gsub(/r\u{0314}/, 'rh').gsub(/rr/, 'rrh').gsub('ay', 'au').gsub('ey', 'eu').gsub('ēy', 'ēu').gsub('oy', 'ou').gsub('yi', 'ui')
      result << "#{esp_rude}#{rho}#{partial_trans}" if word.grc?
      result << word unless word.grc?
    end
    result.join(' ')
  end

  def tokenize
    gsub(/([[:punct:]]|·|\.|;)/, ' \1').split
  end

  def decode
    unpack('U*').map { |i| "\\u#{i.to_s(16).rjust(4, '0')}" }.join
  end

  def decode_dump
    h = {}
    each_char do |c|
      h[:"#{c}"] = c.dump
    end
    h
  end

  def normalize
    unicode_normalize(:nfc)
  end

  def decompose
    unicode_normalize(:nfd)
  end
end

# Word frequency
class Array
  def word_freq
    # str = str.scan(/\b[\w+|\p{Greek}]+.*?\b/)
    freq = Hash.new(0)
    each do |word|
      word = word.downcase
      freq[word] += 1 if word =~ /\p{Greek}+/
    end
    result = freq.sort_by { |_a, b| b }
    result.reverse!
    result
  end
end
