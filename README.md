# <a href="http://18.180.23.221/">English_together</a>

![English_together](https://gyazo.com/5aecf8db51e4a501826053a0461787c9/raw)

![English_together](https://gyazo.com/8f9425b53f7ed892ef366a8a9037a347/raw)

![English_together](https://gyazo.com/f6f49efcbeff317e6207f5ead0f8bae9/raw)

## 🌐 App URL

### **http://18.180.23.221/**  

## 🔍 Usage

<h3>テストユーザーログイン</h3>
<p>email: test@test.com</p>
<p>password: test1234</p>

`$ git clone https://github.com/Konsei0516/English_together.git`<br>
`$ cd English_together`<br>
`$ bundle install`<br>
`$ rails db:create`<br>
`$ rails db:migrate`<br>
`$ rails s`<br>
👉 http://localhost:3000

## 💬 What App?
English togetherはチャットと投稿機能を使用して英語をアウトプットできるWEBアプリケーションです。

## ❓Why?
<p>プログラミング学習をしていると英語からは逃れられません。</p>
<p>また、プログラミング学習を通じて自分で調べること、調べたことや学習したことをアウトプットすることの重要性に気がつきました</p>
<p>このことから英語にも同じことが言えると考え、リアルタイムで英会話をすることができ、わからなかったことを投稿しアウトプットできるアプリケーションを作成しようと考えました。</p>


## 📦 機能一覧
<ul>
  <li>リアルタイムチャット(Action cable)</li>
  <li>ログイン機能(devise)</li>
  <li>英単語投稿機能(CURD)</li>
  <li>画像登録機能(carriewave)</li>
  <li>タグ機能(acts-as-taggable-on)</li>
  <li>コメント投稿・削除機能(Ajax)</li>
  <li>いいね機能(Ajax)</li>
  <li>ユーザーフォロー機能(Ajax)</li>
  <li>ページネーション機能(kaminari)</li>
  <li>ランキング機能</li>
  <li>検索機能（インクリメンタルサーチ）</li>
  <li>RSpecによる単体テスト</li>
</ul>


## 📗 使用技術
<ul>
  <li>Ruby 2.5.1</li>
  <li>Ruby on Rails 5.2.3</li>
  <li>Sass, Bootstrap, jQuery</li>
  <li>RSpec</li>
  <li>Unicorn</li>
  <li>Nginx</li>
  <li>Capistrano</li>
  <li>AWS(VPC,EC2,Route53,RDS)</li>
</ul>

## 📝　今後の課題
<ul>
  <li>フォローしているもの同士のDM機能</li>
  <li>レスポンシブ対応</li>
  <li>Dockerでの環境構築</li>
</ul>

## 👀 DEMO
![Screenshot from Gyazo](https://gyazo.com/8ee92ae379d450432f3f255a6748418e/raw)
![Screenshot from Gyazo](https://gyazo.com/a59811ae9387f1f6621bce0880ef5275/raw)
