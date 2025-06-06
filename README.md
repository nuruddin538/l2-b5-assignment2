# Bonus Section

## 1. PostgreSQL কী?

<p>PostgreSQL হলো একটি শক্তিশালী, ওপেন-সোর্স রিলেশনাল ডেটাবেজ ম্যানেজমেনট সিস্টেম (RDBMS) যা ডেটা সংরক্ষণ, পরিচালনা ও বিশ্লেষণের জন্য ব্যবহৃত হয়। এটি SQL (structure Query Language)-এর পাশাপাশি উন্নত  ফিচার যেমন ট্রানজ্যাকশন, ভিউ, ট্রিগার, স্টোরড প্রোসিডিউর এবং ACID কমপ্লায়েনস সাপোর্ট করে। <br/>
  PostgreSQL-এর কিছু গুরুত্বপূর্ণ বৈশিষ্ট্য হলো :
<ul>
<li> ওপেন সোর্স এবং ফ্রি </li>
<li>  একাধিক ব্যবহারিক একসাথে কাজ করতে পারে </li>
<li> বহু ডেটা টাইপ ও কাস্টম টাইপ সাপোর্ট করে </li> 
<li> JSON ও নন-রিলেশনাল ডেটা সাপোর্ট করে (NoSQL- এর মত ফিচার) </li>
<li> ডেটা অখণ্ডতা বজায় রাখার জন্য সুরক্ষা ও কনসট্রেইনট সাপোর্ট করে </li>
</ul>

**সংক্ষেপে:**
PostgreSQL একটি অত্যাধুনিক ডেটাবেজ সিস্টেম যা সেকলেবল, নিরাপদ এবং বিভিন্ন অ্যাপিলকেশন ব্যবহারযোগ্য যেমন ওয়েব অ্যাপিলকেশন, বিশ্লষণাতমক সিস্টেম ও মোবাইল অ্যাপ।</p>

## 2. PostgreSQL- এ ডেটাবেজ স্কিমার উদ্দেশ্য কী?

<p>ডেটাবেজ স্কিমা হলো  PostgraSQL- এ ডেটা সংগঠনের একটি পদ্ধতি।  এটি এক ধরনের লজিক্যাল কনটেইনার,  যেখানে টেবিল, ভিউ, ফাংশন, ইনডেক্স ইত্যাদি রাখা হয়।</p>

### স্কিমার উদ্দেশ্য ও উপকারিতা:

<ol>
<li> _ডেটার সংগঠন ও শ্রেণীবিন্যাস:_
স্কিমা ব্যবহার করে ডেটাবেজকে ছোট ছোট অংশ ভাগ করা যায়, যা বড় ডেটাবেজকে সহজে পরিচালনা করতে সাহায্য করে। </li>
<li>__নেইমসেপস বা আলাদা নামের পরিসর তৈরি করে :__
একই ডেটাবেজে একই নামে একাধিক টেবিল রাখা সম্ভব হয় যদি তারা আলাদা স্কিমায় থাকে
</li>
<li> _সিকিউরিটি ও  পারমিশন কনট্রোল:_
 স্কিমা ভিত্তিক পারমিশন সেট করা যায়। যার ফলে ব্যবহারকারীরা  নিদিষ্ট স্কিমার মধ্যে কাজ করতে পারে। 
</li>
<li>
_মাল্টি ইউজার এনভায়রনমেন্ট এ সহায়ক_:
স্কিমা ব্যবহারে একাধিক ইউজার একই ডেটাবেজে স্বাধীনভাবে কাজ করতে পারে, একে অপরের ডেটাতে না হস্তকেষপ করেই।
</li>
</ol>
<br/>

`CREATE SCHEMA wildlife;
CREATE TABLE wildlife.sightings(...)`

## 3. PostgreSQL-এ primary key এবং৷ Foreign key কী? ব্যাখ্যা কর।

**primary key :** <br/>

Primary key হলো এমন একটি কলাম, যা প্রতিটি রেকর্ডেকে অন্য রেকর্ড থেকে আলাদা করে চিনে। এটি :
. অবশ্যই ইউনিক হতে হবে।
. NULL হতে পারবেনা।

`CREATE TABLE rangers(
  ranger_id SERIAL PRIMARY KEY,
  name VARCHER(100),region VARCHER(100)
);`

এখানে৷ ranger_id হলো primary key, যা প্রতিটি রেঞ্জেরকে ইউনিকভাবে শনাক্ত করে।

Foreign key :
Foreign key হলো এমন একটি কলাম যা অন্য টেবিলের primary key এর সাথে সংযুক্ত থাকে। এটি টেবিলগুলোর মধ্যে সমপর্ক তৈরি করে এবং ডেটার অখণ্ডতা বজায় রাখে।

`CREATE TABLE sightings(
sighting_id SERIAL PRIMARY KEY,
ranger_id INT REFFRENCES rangers(ranger_id),
...
);`

এখানে ranger_id হলো Foreign key, যা Rangers টেবিলের ranger_id এর সাথে সংযুক্ত। এর মাধ্যমে প্রতিটি sighting কোন রেঞ্জার করেছে, তা ট্র্যাক করা যায়।

## 4. VARCHAR এবং CHAR ডেটা টাইপের মধ্যে পার্থক্য কী?

PostgreSQL এ CHAR এবং VARCHAR দুটিই সিট্রং টাইপ, কিন্তু এদের মধ্য কিছু গুরুত্বপূর্ণ পাথর্ক্য রয়েছে।

### 1. CHAR(Fixed-length character)

<li> এটি নিদিষ্ট দৈর্ঘোর সিট্রং ধরে রাখে। </li>
<li> যদি আপনি কম অক্ষর প্রবেশ করান, তাহলে অবশিষ্ট স্থান ফাঁকা দিয়ে পূর্ণ করা হয়।</li>
<li> এটি ধারাবাহিক দৈর্ঘোর ডেটার জন্য উপযোগী। </li>
<br/>

` name CHAR(10)`

**যদি 'cat' প্রবেশ করানো হয়, তাহলে সেটি হবে 'cat'**

### 2. VARCHAR ( variable-lenght character)

<li> এটি পরিবর্তনশীল দৈর্ঘোর সিট্রং সংরক্ষণ করে।</li> 
<li>যতটুকু অক্ষর দেওয়া হয়, ঠিক ততটুকু জায়গা ব্যবহার করে।</li> 
<li> সাধারণত ব্যবহারে বেশি উপযোগী কারণ এতে জায়গা সাশ্রয় হয়।</li>

` name VARCHAR(10)`
<br/>

যদি 'cat' প্রবেশ করানো হয়, তাহলে সেটি হবে 'cat'

## 5. SELECT স্টেটমেনটে WHERE clause উদ্দেশ্য কী?

WHERE clause একটি ফিল্টারিং টুল যা SELECT স্টেটমেনটে ব্যবহার করা হয় নিদিষ্ট শর্ত পূরণ করে এমন ডেটা নির্বাচন করার জন্য।

### মূল উদ্দেশ্য :

WHERE clause এর মাধ্যমে আমরা বলতে পারি।
শুধু সেইসব রের্কড দেখাও যেগুলো এই শর্ত পূরণ করে।

এখানে আমরা শুধু সেই রেঞ্জেরের তথ্য দেখতে চাই যিনি 'River Delta' অঞ্চলে কাজ করেন

| ranger_id | name        | region         |
| --------- | ----------- | -------------- |
| 1         | Alice Green | Northern Hills |
| 2         | Bob White   | River Delta    |
| 3         | Carol King  | Mountain Range |

`SELECT * FROM rangers WHERE region = 'River Delta'`
