# 関数を引数として

sent = ['Take', 'care', 'of', 'the', 'sense', ',', 'and', 'the', 'sounds', 'will', 'take', 'care', 'of', 'themselves', '.']

def extract_property(prop):
	return [prop(word) for word in sent]

extract_property(len)

def last_letter(word):
	return word[-1]

extract_property(last_letter)

sorted(sent)

sorted(sent, lambda x, y: cmp(len(y), len(x)))


# 4.5.2 累積的関数

def search1(substring, words):
	result = []
	for word in words:
		if substring in word:
			result.append(word)
		return result

def search2(substring, words):
	for word in words:
		if substring in word:
			yield word

print "search1:"
for item in search1('zz', nltk.corpus.brown.words()):
	print item

print "search2:"
for item in search2('zz', nltk.corpus.brown.words()):
	print item

def permutations(seq):
	if len(seq) <= 1:
		yield seq
	else:
		for perm in permutations(seq[1:]):
			for i in range(len(perm)+1):
				yield perm[:i] + seq[0:1] + perm[i:]

list(permutations(['police', 'fish', 'buffalo']))

# 4.5.3 高階関数

def is_content_word(word):
	return word.lower() not in ['a','of','the','and','will','.',',']

filter(is_content_word, sent)
[w for w in sent if is_content_word(w)]

lengths = map(len, nltk.corpus.brown.sents(categories="news"))
sum(lengths) / len(lengths)

lengths = [len(w) for w in nltk.corpus.brown.sents(categories="news")]

# 名前付き引数
def repeat(msg='<empty>', num=1):
	return msg * num

repeat(num=3)

repeat(msg="Alice")

repeat(num="5",msg="Alice")


# 3種類の関数の呼び出しかた
def freq_words(file, min=1, num=10):
	text = open(file).read()
	tokens = nltk.word_tokenize(text)
	freqdist = nltk.FreqDist(t for t in tokens if len(t) >= min)
	return freqdist.keys()[:num]

fw = freq_words('ch01.rst', 4, 10)
fw = freq_words('ch02.rst', min=4, num=10)
fw = freq_words('ch03.rst', num=10, min=4)

def find_words(text, wordlength, result=[]):
	for word in text:
		if len(word) == wordlength:
			result.append(word)
		return result

find_words(['aaa','bbb','ccc'], 3)
find_words(['aaa','bb','ccc'],2,['ur'])
find_words(['aaa','bbb','ccc'], 3)
# ３番目は予想通りに機能しない

#4.6.4 デバッグ手法
import pdb
pdb.run(['boy','girl'].append(['not eather boy or girl', 'not defined']))

# 4.6.5 防衛的プログラミング

# 回帰テスト　一連おテストケースを同時に維持管理していくこと

# 4.7 アルゴリズムデザイン

# 分割統治法 一階全部分ける　その後　マージしていく
# 二分探索　

# 4.7.1 再帰

def factorial(n):
	result = 1
	for i in range(n):
		result *= (i+1)
	return result