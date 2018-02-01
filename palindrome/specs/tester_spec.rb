require 'rspec'
require_relative '../tester'

RSpec.describe Tester do
  [Tester::T1, Tester::T2].each do |clz|
    context 'words' do
      it 'should be a palindrome' do
        expect(clz.new.palindrome?('abcdefedcba')).to eq true
      end

      it 'should not be a palindrome' do
        expect(clz.new.palindrome?('hbcdefedcbg')).to eq false
      end
    end

    context 'phrases' do
      it 'should be a palindrome' do
        expect(clz.new.palindrome?('A man, a plan, a canal, Panama!!')).to eq true
      end

      it 'should not be a palindrome' do
        expect(clz.new.palindrome?(%q{
          So sorry Mrs. Fluberdeedupe -- my dog ate my homework. If I had but known
          that you were serious about collecting it today, I wouldn't have covered
          it in au jus and put it in his bowl. Next time, I'll just assume that you
          mean for us to actually do the homework and turn it in. Is there anything
          I can do to make it up to you, or to improve my grade?

          ...

          Call my parents? No, no... I don't think that's necessary. They're already
          mad at me for not making Fido eat some brocolli with it!
        })).to eq false
      end
    end

    context 'edge cases' do
      it 'should handle nil strings' do
        expect(clz.new.palindrome?(nil)).to eq false
      end

      it 'should handle empty strings' do
        expect(clz.new.palindrome?('')).to eq false
      end

      it 'should handle non-strings' do
        expect(clz.new.palindrome?(100)).to eq false
      end
    end
  end
end
