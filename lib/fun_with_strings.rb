module FunWithStrings
  def palindrome?
    
    string = self.to_s.downcase.gsub(/\W/, "")
    string == string.reverse
    
  end
  
  def count_words
    
    words = self.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
    word_counter = Hash.new(0)
    words.each do | word |
      word_counter[word] +=1
    end
    return word_counter
   
  end # def
  
  
  def anagram_groups
    
    words = self.split(' ')
    anagrams = Array.new
    processed_indicies = Array.new
    
    x = 0
    while x < words.length
    
      if processed_indicies.include?(x)
        next
      end
      
      anagram_group = Array.new
      anagram_group.push(words[x])
      
      y = 0
      while y < words.length
      
      if y != x
        word_x = words[x].chars.sort_by(&:downcase).join
        word_y = words[y].chars.sort_by(&:downcase).join
        if word_x == word_y
          anagram_group.push(words[y])
        end
      end
      y += 1
      end
    
    anagrams.push(anagram_group)
    x += 1
        
    end
    
    return anagrams
    
  end # def
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
