require ('open-uri')
require ('json')

get_info = JSON.parse open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=').read

drw_numbers = []
get_info.each do |k, v|
   drw_numbers << v if k.include? 'drwtNo'
end
drw_numbers.sort!

bonus_number = get_info["bnusNo"]
my_numbers = [*1..45].sample(6).sort
match_numbers = drw_numbers & my_numbers
match_cnt = match_numbers.count  

if match_cnt == 6 
 result = '1등'
elsif match_cnt == 5 && my_numbers.include?(bonus_number)
 result = '2등'
elsif match_cnt == 5
 result = '3등'
elsif match_cnt == 4
 result = '4등'
elsif match_cnt == 3
 result =  '5등'
else 
 result = '꽝'
end

print "이번주 로또 번호는 #{drw_numbers} 이고,  보너스 번호는 #{bonus_number} 입니다."; puts
print "추첨한 로또 번호는 #{my_numbers} 입니다."; puts
print "겹치는 번호는 #{match_numbers} 입니다."; puts
puts  "결과는 #{result} 입니다."