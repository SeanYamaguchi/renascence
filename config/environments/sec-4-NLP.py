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
	# range は0から

def factorial2(n):
	if n == 1:
		return 1
	else:
		return n * factorial2(n-1)

def insert(trie, key, value):
	if key:
		first, rest = key[0], key[1:]
		if first not in trie:
			trie[first] = {}
		insert(trie[first], rest, value)
	else:
		trie['value'] = value

trie = nltk.defaultdict(dict)
insert(trie, 'chat', 'cat')
insert(trie, 'chien'. 'dog')
insert(trie, 'chair', 'flesh')
insert(trie, 'chic', 'stylish')
trie = dict(trie) # for nicer printing
trie['c']['h']['a']['t']['value']

# 4.7.2 空間と時間のトレードオフ
# 補助的なデータ構造の導入

def raw(file):
	contents = open(file).read()
	contents = re.sub(r'<.*?>', ' ', contents)
	contents = re.sub('\s+', ' ', contents)
	return contents

def snippet(doc, term): # buggy
	text = ' '*30 + raw(doc) + ' '*30
	pos = text.index(term)
	return text[pos-30:pos+30]

print "Building index ..."

files = nltk.corpus.movie_reviews.abspaths()
idx = nltk.index((w, f) for f in files for w in raw(f).split())

query = ''
while query = raw_input("query> ")
if query in idx:
	for doc in idx[query]:
		print snippet(doc, query)
	else:
		print "Not Found"

def preprocess(ragged_corpus):
	words = set()
	tags = set()
	for sent in tagged_corpus:
		for word, tag in sent:
			words.add(word)
			tags.add(tag)
		vm = dict((w, i) for (i, w) in enumerate(words))
		tm = dict((t, i) for (i, t) in enumerate(words))
		return [[(vm[w], tm[t]) for (w,t) in sent] for sent in tagged_corpus]


from timeit import Timer
vocab_size = 100000
setup_list = "import random; vocab = range(%d)" % vocab_size
setup_set = "import random; vocab = set(range(%d))" % vocab_size
statement = "random.randint (0, %d) in vocab" % vocab_size * 2
print Timer(statement, setup_list).timeit(1000)
print Timer(statement, setup_set).timeit(1000)

# 4.7.3 動的計画法
# 呼び出し構造

def virahanka1(n):
	if n == 0:
		return [""]
	elif n == 1:
		return ["S"]
	else:
		s = ["S" + prosody for prosody in virahanka1(n-1)]
		l = ["L" + prosody for prosody in virahanka1(n-2)]

def virahanka2(n):
	lookup = [[""], ["S"]]
	for i in range(n-1):
		s = ["S" + prosody for prosody in lookup[i+1]]
		l = ["L" + prosody for prosody in lookup[i]]
	return s + 1

def virahanka3
	if n not in lookup:
		s = ["S" + prosody for prosody in virahanka3(n-1)]
		l = ["L" + prosody for prosody in virahanka3(n-2)]
		lookup[n] = s + 1
	return lookup[n]

from nltk import memoize
@memoize
def virahanka4(n):
	if n == 0:
		return [""]
	elif:
		return ["S"]
	else:
		s = ["S" + prosody for prosody in virahanka4(n-1)]
		l = ["L" + prosody for prosody in virahanka4(n-2)]
		return s + 1

# 4.8 Python ライブラリの例

# 4.8.1 Matplotlib

colors = 'rgbcmyk' # red, green, blue, cyan, magenta, yellow, black
def bar_chart(categories, words, counts):
	"Plot a bar chart showing counts for each word by category"
	import pylab
	ind = pylab.arange(len(words))
	width = 1 / (len(categories))
	bar_groups = []
	for c in range(len(categories)):
		bars = pylab.bar(ind+c+width, counts[categories[c]], width,)

# 4.8.3 CSV

sleep
