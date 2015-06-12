# urlを開いてその内容をrawに保存
from urllib import urlopen

url = "http://www.gutenberg.org/files/2554/2554.txt"
raw = urlopen(url).read()
type(raw)

# テキストをtoken化
import nltk

tokens = nltk.word_tokenize(raw)
type(tokens)
len(tokens)

# 始まりと終わりを見つける
raw.find("PART I")
raw.rfind("End of Project Gutenberg's Crime")
raw = raw[5303:1157681]

# webのテキストを取得
url = "http://news.bbc.co.uk/2/hi/health/2284783.stm"
html = urlopen(url).read()
html[:60]

# html を取り除いてテキストをtoken化
# 動かなかった
raw = nltk.clean_html(html)
tokens = nltk.word_tokenize(raw)
tokens

tokens = tokens[96:339]
text = nltk.Text(tokens)
text.concordance('gene')

# コロケーション　同じ単語が続いて出てくる割合

# BeautifulSoup について
from BeautifulSoup import BeautifulSoup          # For processing HTML
from BeautifulSoup import BeautifulStoneSoup     # For processing XML
import BeautifulSoup                             # To get everything

# clean html
def clean_html(html):
    """
    Remove HTML markup from the given string.
 
    :param html: the HTML string to be cleaned
    :type html: str
    :rtype: str
    """
 
    # First we remove inline JavaScript/CSS:
    cleaned = re.sub(r"(?is)<(script|style).*?>.*?(</\1>)", "", html.strip())
    # Then we remove html comments. This has to be done before removing regular
    # tags since comments can contain '>' characters.
    cleaned = re.sub(r"(?s)<!--(.*?)-->[\n]?", "", cleaned)
    # Next we can remove the remaining tags:
    cleaned = re.sub(r"(?s)<.*?>", " ", cleaned)
    # Finally, we deal with whitespace
    cleaned = re.sub(r"&nbsp;", " ", cleaned)
    cleaned = re.sub(r"  ", " ", cleaned)
    cleaned = re.sub(r"  ", " ", cleaned)
    return cleaned.strip()

# ブロモスフィアを散策
import feedparser
llog = feedparser.parse("http://languagelog.ldc.upenn.edu/nll/?feed=atom")
llog['feed']['title']

len(llog.entries)

post = llog.entries[2]
post.title

content = post.content[0].value
content[:70]

# User からの入力を受け取る
s = raw_input("Enter some text:")
print "You typed," len(nltk.word_tokenize(s)), "words."
raw = open('document.txt').read()
type(raw)

tokens = nltk.word_tokenize(raw)
type(tokens)

words = [w.lower() for w in tokens]
type(words)

vocab = sorted(set(words))
type(vocab)

## 3-2
# text 処理
# 改行を含む場合
couplet = """shall I compare thee to a Summer's day?
			Thou are more lovely and more temperate:"""

# 連結
"very" + "very" + "very"
"very" * 3

# list に連結
boy = ["a boy", "two boys", "three boys"]
boy + ["the final and the strongest monstrous lady"]


## 3-3 Unicode
# 符号化　Unicode 変換すること
path = nltk.data.find('corpora/unicode_samples/polish-lat2.txt')
import codecs
f = codecs.open(path, encoding='latin2')

for line in f:
    line = line.strip()
    print line.encode('unicode_escape')

ord('a')

a = u'\u0061'
a

