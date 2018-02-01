class Tester
  class T1
    def palindrome?(string)
      return false if !valid?(string)
      s = sanitize(string)
      s == s.reverse
    end

    def sanitize(string)
      string.to_s.gsub(/[^a-zA-Z]/, '').downcase
    end

    def valid?(string)
      string.is_a?(String) && string.length > 0
    end

  end

  class T2 < T1
    def palindrome?(string)
      return false if !valid?(string)
      s = sanitize(string)
      i = 0
      l = s.length
      while i < l
        return false if s[i] != s[l - i - 1]
        i += 1
      end
      return true
    end

  end
end
