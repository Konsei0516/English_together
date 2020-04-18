# <a href="http://english-together.work/">English_together</a>

![English_together](https://gyazo.com/5aecf8db51e4a501826053a0461787c9/raw)

![English_together](https://gyazo.com/8f9425b53f7ed892ef366a8a9037a347/raw)

## 🌐 App URL

### **http://english-together.work/**  

## 🔍 Usage

`$ git clone https://github.com/Konsei0516/English_together.git`<br>
`$ cd English_together`<br>
`$ bundle install`<br>
`$ rails db:create`<br>
`$ rails db:migrate`<br>
`$ rails s`<br>
👉 http://localhost:3000

## 💬 What App?
English togetherはチャットと投稿機能を使用して英語をアウトプットできる学習WEBアプリケーションです。

## ❓Why?
<p>プログラミング学習をしていると英語からは逃れられません。</p>
<p>また、プログラミング学習を通じて自分で調べること、調べたことや学習したことをアウトプットすることの重要性に気がつきました</p>
<p>このことから英語にも同じことが言えると考え、リアルタイムで英会話をすることができ、わからなかったことを投稿しアウトプットできるアプリケーションを作成しようと考えました。</p>


## 📦 機能一覧
<p>・リアルタイムチャット(Action cable)<br>英語でのリアルタイムチャットができます。</p>
<p>・英単語投稿機能(CURD)<br>チャットや普段の学習から学んだことをアウトプットします。</p>
<p>・画像登録機能(carriewave)<br>プロフィール画像を設定できます。</p>
<p>・タグ機能(acts-as-taggable-on)<br>投稿の際にタグを付ける機能です。</p>
<p>・コメント投稿・削除機能(Ajax)<br>投稿に対して非同期通信でコメントできます。</p>
<p>・いいね機能(Ajax)<br>投稿に対していいね！することができます。</p>
<p>・ユーザーフォロー機能(Ajax)<br>他のユーザーをフォローすることができます。</p>
<p>・ページネーション機能(kaminari)<br>ページネーションによりページの肥大化を抑えます。</p>
<p>・ランキング機能<br>いいねされた投稿、アウトプットが多いユーザーをランキング化しました。</p>
<P>・検索機能（インクリメンタルサーチ）<br>ユーザーと英単語を検索できます</p>


## 📗 使用技術
<p>Ruby 2.5.1</p>
<p>Ruby on Rails 5.2.3</p>
<p>Sass, Bootstrap, jQuery</p>
<p>Unicorn</p>
<p>Nginx</p>
<p>Capistrano</p>
<p>AWS(VPC,EC2,Route53,RDS)</p>
