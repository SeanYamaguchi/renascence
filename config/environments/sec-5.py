# 5

# 5.1 タガーの利用

import nltk

text = nltk.word_tokenize("And now fot something completely different.")
nltk.pos_tag(text)

# 5.2.3 簡易版品詞タグセット

# 5.2.5 動詞
# nltk.FreqDist 

# 頻度分布
fdist1 = FreqDist(text1)
fdist1

vocabulary1 = fdist1.keys()
vocabulary1[:50]

fdist['whale']

# 5.3 Python のディクショナリを利用して単語を属性にマップする

# 5.3.1 展示付きリストついディクショナリ

# 5.3.2 Python におけるディクショナリ

pos = {}
pos

pos['colorless'] = 'ADJ'
pos

pos['ideas'] = 'N'
pos['sleep'] = 'V'
pos['furiously'] = 'ADJ'
pos

for word in sorted(pos):
	print word + ":", pos[word]

pos.key()

pos.values()

pos.items()

for key, val in sorted(pos.items()):
	print key + ":", val

#
pos['sleep'] = 'V'
pos['sleep']

pos['sleep'] = 'N'
pos['sleep']

# ディクショナリを定義する

pos = {'colorless': 'ADJ', 'ideas': 'N', 'sleep': 'V', 'furiously': 'ADV'}
pos = dict(colorless='ADJ', ideas='N', sleep='V', furiously='ADV')

# デフォルトディクショナリ

frequency = nltk.defaultdict(int)
frequency['colorless'] = 4
frequency['ideas']

pos = nltk.defaultdict(list)
pos['sleep'] = ['N'. 'V']
pos['ideas']

pos = nltk.defaultdict(labda: 'N')
pos['colorless'] = 'ADJ'
pos['blog']

pos.item()

f = lambda: 'N'
f()

def g():
	return 'N'

alice = nltk.corpus.gutenberg.words('carroll-alice.txt')
vocab = nltk.FreqDist(alice)
v1000 = list(vocab)[:1000]
mapping = nltk.defaultdict(lambda: 'UNK')
for v in v1000:
	mapping[v] = v

alice2 = [mapping[v] for v in alice]
alice2[:100]

# 5.3.5 辞書の値をインクリメント

counts = nltk.defaultdict(int)
from nltk.corpus import brown
for (word, tag) in brown.tagged_words(categories='news'):
	counts[tag] += 1

list(counts)

from operator import itemgetter
sorted(counts.items(), key=itemgetter(1), reverse=True)

[t for t, c in sorted(counts.items(), key=itemgetter(1), reverse=True)]

pair = ('NP', 8336)
pair[1]
itemgetter(1)(pair)

my_dictionary = nltk.defaultdict
for item in sequence