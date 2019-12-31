CREATE TABLE IF NOT EXISTS category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXISTS Minigame (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    mini_game_year YEAR NOT NULL,
    mini_game_order INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXISTS questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    answer TEXT NOT NULL,
    question_year YEAR NOT NULL,
    category_id INT NOT NULL,
    point_value SMALLINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES category(id)
);
alter table questions drop constraint FOREIGN KEY

insert into category (category_name) values ('Culture and Trends')
insert into category (category_name) values ('Global Events');
insert into category (category_name) values ('Sports');
insert into category (category_name) values ('Movies, Music, and TV');
insert into category (category_name) values ('Misc.');

insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Test', 'test answer', 2019, 1, 400)

insert into Minigame (description, mini_game_year, mini_game_order)
values ('Welcome my beautiful friends', 2019, 1)


--Query to get the question info
select q.question_text, q.answer, q.question_year, q.point_value, c.category_name from questions as q
    inner join category as c on c.id = q.category_id
    where q.question_year = 2019




--Question Inserts
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('2015 was considered the future in this popular 80s movie trilogy about a teenager, a scientist, and a time travelling DeLorean',
 'Back to the Future', 2019, 1, 100);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('What date was the world set to end due to the conclusion of the 2012 Aztec Calendar (100 points if you can name the year)',
 'December 21st, 2012', 2019, 1, 200);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('What Tesla model came out in 2019?',
 'Model S', 2019, 1, 300);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('What technologies came out in the 2010s (+75 for every right one, -50 for every wrong, can’t have less than 0 points, must get all 4 to get 400) \n
a. Ipad 1 \n
b. Nintendo DSi \n
c. Oculus Quest \n
d. Tesla Cybertruck \n
e. Iphone 3 \n
f. Xbox Kinect \n
g. Macbook air \n
h. Droid Turbo
',
 'Ipad1, Oculus Quest, Xbox Kinect, Droid Turbo', 2019, 1, 400);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Name 5 of the 10 winners of the game awards for the past decade (2010-2019, 75 points each, 500 total)',
 '2010 - Red Dead Redemption, 2011 - Elder Scrolls V: Skyrim, 2012 - The Walking Dead, 2013 - Grand Theft Auto V, 2014 - Dragon Age Inquisition, 2015 - The Witcher 3 Wild Hunt, 2016 - Overwatch, 2017 - The Legend of Zelda Breath of the Wild, 2018 - Of War, 2019 - Sekiro Shadows Die Twice', 2019, 1, 500);


insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Between 1853 and 1856, a war named after this region was fought between two Eurasian empires. In 2014, this region once again became embroiled in an international conflict. What is the name of this region that Russia annexed from Ukraine?',
 'Crimea', 2019, 2, 100);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('In 2019, this man became the Prime minister of England after Theresa May resigned',
 'Boris Johnson', 2019, 2, 200);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('In October 2019 Putin said this in response to a UN speech: \n
 	“The modern world is complex and different and ... people in Africa or in many Asian countries want to live at the same wealth level as in Sweden” \n
Who was he responding to?',
 'Greta Thunberg', 2019, 2, 300);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Complete the sentence that was an actual headline in the Washington Post: Abu Bakr al-Baghdadi, austere  _____ _____ at the head of _____ _____, dies at 48 (no word bank, 50 points for each correct)',
 'religious, scholar, Islamic State', 2019, 2, 400);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Name the five countries that experienced Arab Spring in 2011, and whether that conflict is ongoing or resolved (75 points each, 500 for all)',
 'Syria - ongoing, Egypt - resolved, Bahrain - resolved, Tunisia - resolved, Libya - either answer is good there', 2019, 2, 500);


insert into questions (question_text, answer, question_year, category_id, point_value)
values ('During this decade, this man set the world record for most grand slams in men''s tennis',
 'Roger Federer', 2019, 3, 100);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Name the two teams played in the 2019 superbowl. And which team won',
 'L.A. Rams and New England Patriots. Patriots won', 2019, 3, 200);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Which of the following people are on the Women’s US Soccer team. \n There are four correct answers. (+75 for each correct one, must get all to get the full 300) \n
a. Morgan Brian \n
b. Tobin Heath \n
c. Meagan McGlincy \n
d. Mallory Pugh \n
e. Beatrice Williams \n
f. Hillary Sherman \n
g. Casey Short
',
 'Morgan Brian, \n
  Tobin Heath, \n
  Mallory Pugh, \n
  Casey Short
', 2019, 3, 300);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('What colleges are playing in the upcoming Rose Bowl game (150 points for naming one team)?',
 'Oregon Ducks vs. Wisconsin Badgers', 2019, 3, 400);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Name five 2010s  medalists in any of the following Olympic events: \n
Alpine Skiing, Fencing, Curling, Skeleton, Figure skating, Tae Kwon Do, Cycling
(100 points for each one)
',
 'Skiing: https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_alpine_skiing \n
Fencing:
https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_fencing_(men) \n
https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_fencing_(women) \n
Curling: https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_curling \n
Skeleton: https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_skeleton \n
Figure Skating: 
https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_figure_skating \n
Swimming: https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_swimming_(men) \n
	https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_swimming_(women) \n
', 2019, 3, 500);


insert into questions (question_text, answer, question_year, category_id, point_value)
values ('This character defeated Thanos',
 'Ironman', 2019, 4, 100);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('This character is from an HBO fantasy show that ran for eight seasons. Although he started out as a scumbag, this character is largely considered redeemed by the fanbase. Who is this character that was killed by falling debris at the final battle of King’s Landing.',
 'Jamie Lanister', 2019, 4, 200);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Name two of the number one Billboard pop songs for any of the following years: 2010-2019 (150 points each)',
 '“Tik Tok” - 2010 , “Rolling in the Deep” - 2011, “Somebody that I used to Know” - 2012, “Thrift Shop” - 2013,
“Happy” - 2014 , “Uptown Funk” - 2015,  “Love Yourself” - 2016, “Shape of You” - 2017, Drake’s Song - 2018 , “Old Town Road” - 2019
', 2019, 4, 300);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('What are the titles of all five Star Wars films to come out this decade. Also name at least one star wars tv show to release this decade. (75 points for each correct answer, must get all 6 to get the full 500 points)',
 'Force Awakens, Rouge One, Last Jedi, Solo, Rise of Skywalker, Rebels, Mandalorian', 2019, 4, 400);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('What predictions did the 2015 finale of Parks and Rec get right? (100 points for each correct answer)',
 'Game of Thrones going “off the rails”, Cubs winning the World Series, Data privacy/tech company scandals, VR headsets becoming mainstream, Twinpeaks reboot, Drone deliveries, Bourne Sequel', 2019, 4, 500);

insert into questions (question_text, answer, question_year, category_id, point_value)
values ('President Trump raised a lot of eyebrows when he proposed buying this country from Denmark',
 'Greenland', 2019, 5, 100);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('In April of 2019 a NASA telescope made history by observing this object',
 'Black Hole', 2019, 5, 200);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('What was the name of the game show host that was diagnosed with stage four pancreatic cancer earlier this year? And which show is he famous for hosting?',
 'Alex Trebek', 2019, 5, 300);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Name the runner up (second place) in the 2012 Republican primary, the 2016 democratic primary, and the 2016 republican primary. Also name the runner up in the ongoing democratic primary (75 points each, 400 for all):',
 'Rick Santorum, 2016 Dem - Bernie Sanders, 2016 Republican - Ted Cruz, 2020 - (Bernie again or Warren)', 2019, 5, 400);
insert into questions (question_text, answer, question_year, category_id, point_value)
values ('Name 5 of the 10 guests who have hosted pewdiepie’s meme review? (100 points for each correct answer)',
 'Ben Shapiro, Elon Musk, Justin Rolland, MrBeast, Chris, Chandler, Blue Shirt Kid 1, Blue Shirt Kid 2, Dr. Phil', 2019, 5, 500);