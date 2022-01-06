create schema if not exists chakgong;
use chakgong;

create TABLE IF NOT EXISTS owner (
	id BINARY(16) not NULL,
	name varchar(10),
	phone varchar(13),
	email varchar(50),
    reg_date datetime,
	PRIMARY KEY(id)
);
insert into owner values(UUID_TO_BIN('77777770-f957-430e-8689-b5129c0bb75f'), '정서한','010-6821-1250','jungjuseong@gmail.com', current_timestamp());
insert into owner values(UUID_TO_BIN('77777771-f957-430e-8689-b5129c0bb800'), '공신','010-9000-8888','gongsin@gmail.com', current_timestamp());
insert into owner values(UUID_TO_BIN('77777772-f957-430e-8689-b5129c0bb800'), '한국인','010-2221-1234','iamkorean@gmail.com', current_timestamp());

select * from owner;

create TABLE IF NOT EXISTS academy (
	id BINARY(16) not NULL,
	owner_id BINARY(16) not NULL,
	name varchar(100) NOT NULL,
	address varchar(200),
	description TEXT,
    keyword varchar(1024),
	image_url varchar(250),
	video_url varchar(250),
    reg_date datetime,
	FOREIGN KEY(owner_id) REFERENCES owner(id),
	PRIMARY KEY(id)
);

insert into academy values(UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f602'), UUID_TO_BIN('77777770-f957-430e-8689-b5129c0bb75f'),
 '첨이지 어서와', '서울시 강남구 대치동', '여기가 대치동에서 제일 잘 가르킨다.', '#최단기#말코사슴#모두합격#최고의성실','http://image_url', 'http://video_url', current_timestamp());

insert into academy values(UUID_TO_BIN('00000001-b5c6-4896-987c-f30f3678f602'), UUID_TO_BIN('77777771-f957-430e-8689-b5129c0bb800'),
 '조만간 합격', '경기도 성남시 분당구', '여기가 분당에서는 짱.', '#먼지가되어#알라스카로#집중집중#마라톤교실','http://image_url', 'http://video_url', current_timestamp());

 insert into academy values(UUID_TO_BIN('00000001-b5c6-4896-987c-f30f3678f603'), UUID_TO_BIN('77777771-f957-430e-8689-b5129c0bb800'),
 '또 하나의 신화', '경기도 성남시 분당구', '여기가 정자동 바로 학원.', '#딴데로가지말기#몰리브로#또박또박#수학교실','http://image_url', 'http://video_url', current_timestamp());


 select a.academy_name, o.owner_name, o.owner_phone from academy a left join owner o on a.owner_id = o.id;




insert into product values (UUID_TO_BIN('6d62d909-f957-430e-8689-b5129c0bb75e'), 'Antifragile', 'Antifragile - Things that gains from disorder. By Nassim Nicholas Taleb', 17.15, 33, '/images/Antifragile.jpg');
insert into product values (UUID_TO_BIN('a0a4f044-b040-410d-8ead-4de0446aec7e'), 'Sapiens', 'Sapiens - A brief history of mankind. By Yuval Noah Harari', 7.99, 115, '/images/Sapiens.jpeg');
insert into product values (UUID_TO_BIN('808a2de1-1aaa-4c25-a9b9-6612e8f29a38'), 'Thinking Fast and Slow', 'Thinking Fast and Slow. By winner of Nobel Prize - Danniel Kahneman', 17.32, 738, '/images/ThinkingFast.jpeg');
insert into product values (UUID_TO_BIN('510a0d7e-8e83-4193-b483-e27e09ddc34d'), 'How to Fail at Almost Everything and Still Win Big', 'How to Fail at Almost Everything and Still Win Big - Kind of Story of My Life. By Scott Adams', 15.00, 820, '/images/HowToFail.jpeg');
insert into product values (UUID_TO_BIN('03fef6ac-1896-4ce8-bd69-b798f85c6e0b'), 'Influence', 'Influence - Psychology of Persuasion. By Robert B. Cialdini Ph.D.', 99.99, 1, '/images/Influence.jpeg');
insert into product values (UUID_TO_BIN('d3588630-ad8e-49df-bbd7-3167f7efb246'), 'Poor Charlie''s Almanack', 'Poor Charlie''s Almanack - Wits and Wisdom of Charles T. Munger. By Peter Kauffman', 10.99, 801, '/images/PoorCharlie.jpeg');
insert into product values (UUID_TO_BIN('819e1fbf-8b7e-4f6d-811f-693534916a8b'), 'Hackers & Painters', 'Hackers & Painters - Big Ideas from Computer Age. By Paul Graham', 14, 808, '/images/Hackers.jpg');
insert into product values (UUID_TO_BIN('3395a42e-2d88-40de-b95f-e00e1502085b'), 'Seeking Wisdom', 'Seeking Wisdom - From Darwin To Mungar. By Peter Bevelin',  12, 127, '/images/Seeking.jpg');
insert into product values (UUID_TO_BIN('3395a43e-2d88-40de-b95f-e00e1502085b'), 'Thinking In Bets', 'Thinking In Bets - Making Smarter Decision. When you don''t have all the facts. By Annie Duke', 18, 438, '/images/ThinkingIn.jpg');
insert into product values (UUID_TO_BIN('837ab141-399e-4c1f-9abc-bace40296bac'), 'Zero to One', 'Zero to One - Notes on Startups, Or How to build future. Peter Theil', 15, 175, '/images/ZeroToOne.jpg');

insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f601'), 'book');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f602'), 'psychology');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f603'), 'influence');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f604'), 'wisdom');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f605'), 'startup');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f606'), 'investing');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f607'), 'lessions');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f608'), 'history');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f609'), 'howto');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f610'), 'journey');
insert into tag (id, name) values (UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f611'), 'decision');

insert into product_tag values (UUID_TO_BIN('6d62d909-f957-430e-8689-b5129c0bb75e'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f602'));
insert into product_tag values (UUID_TO_BIN('6d62d909-f957-430e-8689-b5129c0bb75e'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f601'));
insert into product_tag values (UUID_TO_BIN('a0a4f044-b040-410d-8ead-4de0446aec7e'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f608'));
insert into product_tag values (UUID_TO_BIN('a0a4f044-b040-410d-8ead-4de0446aec7e'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f601'));
insert into product_tag values (UUID_TO_BIN('808a2de1-1aaa-4c25-a9b9-6612e8f29a38'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f602'));
insert into product_tag values (UUID_TO_BIN('808a2de1-1aaa-4c25-a9b9-6612e8f29a38'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f601'));
insert into product_tag values (UUID_TO_BIN('808a2de1-1aaa-4c25-a9b9-6612e8f29a38'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f607'));
insert into product_tag values (UUID_TO_BIN('808a2de1-1aaa-4c25-a9b9-6612e8f29a38'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f611'));
insert into product_tag values (UUID_TO_BIN('510a0d7e-8e83-4193-b483-e27e09ddc34d'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f602'));
insert into product_tag values (UUID_TO_BIN('510a0d7e-8e83-4193-b483-e27e09ddc34d'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f601'));
insert into product_tag values (UUID_TO_BIN('510a0d7e-8e83-4193-b483-e27e09ddc34d'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f610'));
insert into product_tag values (UUID_TO_BIN('03fef6ac-1896-4ce8-bd69-b798f85c6e0b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f602'));
insert into product_tag values (UUID_TO_BIN('03fef6ac-1896-4ce8-bd69-b798f85c6e0b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f603'));
insert into product_tag values (UUID_TO_BIN('d3588630-ad8e-49df-bbd7-3167f7efb246'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f604'));
insert into product_tag values (UUID_TO_BIN('d3588630-ad8e-49df-bbd7-3167f7efb246'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f607'));
insert into product_tag values (UUID_TO_BIN('819e1fbf-8b7e-4f6d-811f-693534916a8b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f605'));
insert into product_tag values (UUID_TO_BIN('819e1fbf-8b7e-4f6d-811f-693534916a8b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f606'));
insert into product_tag values (UUID_TO_BIN('819e1fbf-8b7e-4f6d-811f-693534916a8b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f607'));
insert into product_tag values (UUID_TO_BIN('3395a42e-2d88-40de-b95f-e00e1502085b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f604'));
insert into product_tag values (UUID_TO_BIN('3395a42e-2d88-40de-b95f-e00e1502085b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f607'));
insert into product_tag values (UUID_TO_BIN('3395a43e-2d88-40de-b95f-e00e1502085b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f611'));
insert into product_tag values (UUID_TO_BIN('3395a43e-2d88-40de-b95f-e00e1502085b'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f609'));
insert into product_tag values (UUID_TO_BIN('837ab141-399e-4c1f-9abc-bace40296bac'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f609'));
insert into product_tag values (UUID_TO_BIN('837ab141-399e-4c1f-9abc-bace40296bac'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f605'));
insert into product_tag values (UUID_TO_BIN('837ab141-399e-4c1f-9abc-bace40296bac'), UUID_TO_BIN('00000000-b5c6-4896-987c-f30f3678f601'));

create TABLE IF NOT EXISTS user (
	id BINARY(16) NOT NULL,
	username varchar(16),
	password varchar(72),
	first_name varchar(16),
	last_name varchar(16),
	email varchar(24),
	phone varchar(24),
	user_status varchar(16) NOT NULL DEFAULT 'ACTIVE',
	role varchar(16) NOT NULL DEFAULT 'ROLE_USER',
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS user_token (
	id binary(16) NOT NULL,
	refresh_token varchar(128),
	user_id binary(16) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (user_id) REFERENCES user(id)
);

create TABLE IF NOT EXISTS address (
	id binary(16) NOT NULL,
	number varchar(24),
	residency varchar(32),
	street varchar(32),
	city varchar(24),
	state varchar(24),
	country varchar(24),
	pincode varchar(10),
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS user_address (
	user_id binary(16) NOT NULL ,
	address_id binary(16) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY(address_id)	REFERENCES address(id)
);

create TABLE IF NOT EXISTS payment (
	id binary(16) NOT NULL,
	authorized boolean,
	message varchar(64),
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS card (
	id binary(16)  NOT NULL,
	number varchar(16),
	user_id binary(16) NOT NULL UNIQUE,
	last_name varchar(16),
	expires varchar(5),
	cvv varchar(4),
	FOREIGN KEY(user_id) REFERENCES user(id),
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS shipment (
	id binary(16)  NOT NULL,
	est_delivery_date timestamp,
	carrier varchar(24),
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS orders (
	id binary(16) NOT NULL,
	customer_id binary(16) NOT NULL,
	address_id binary(16) NOT NULL,
	card_id binary(16) ,
	order_date timestamp,
	total numeric(16, 4) DEFAULT 0 NOT NULL,
	payment_id binary(16),
	shipment_id binary(16),
	status varchar(24),
	FOREIGN KEY(customer_id) REFERENCES user(id),
	FOREIGN KEY(address_id)	REFERENCES address(id),
	FOREIGN KEY(card_id) REFERENCES card(id),
	FOREIGN KEY(payment_id)	REFERENCES payment(id),
	FOREIGN KEY(shipment_id) REFERENCES shipment(id),
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS item (
	id binary(16) NOT NULL,
	product_id binary(16) NOT NULL,
	quantity numeric(8, 0),
	unit_price numeric(16, 4) NOT NULL,
	FOREIGN KEY(product_id)	REFERENCES product(id),
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS order_item (
	id binary(16) NOT NULL,
	order_id binary(16) NOT NULL,
	item_id binary(16) NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY(item_id) REFERENCES item(id)
);

create TABLE IF NOT EXISTS authorization (
	id binary(16)  NOT NULL,
	order_id binary(16) NOT NULL,
	authorized boolean,
	time timestamp,
	message varchar(16),
	error varchar(24),
	FOREIGN KEY (order_id) REFERENCES orders(id),
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS cart (
	id binary(16) NOT NULL,
	user_id binary(16) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user(id),
	PRIMARY KEY(id)
);

create TABLE IF NOT EXISTS cart_item (
	cart_id binary(16) NOT NULL,
	item_id binary(16) NOT NULL,
	FOREIGN KEY (cart_id) REFERENCES cart(id),
	FOREIGN KEY(item_id) REFERENCES item(id)
);

insert into user (id, username, password, first_name, last_name, email, phone, user_status, role) values(UUID_TO_BIN('a1b9b31d-e73c-4112-af7c-b68530f38222'), 'scott', '{bcrypt}$2a$10$neR0EcYY5./tLVp4litNyuBy/kfrTsqEv8hiyqEKX0TXIQQwC/5Rm', 'Bruce', 'Scott', 'bruce@scott.db', '234234234', 'ACTIVE', 'USER');
insert into user (id, username, password, first_name, last_name, email, phone, user_status, role) values(UUID_TO_BIN('a1b9b31d-e73c-4112-af7c-b68530f38223'), 'scott2', '{bcrypt}$2a$10$neR0EcYY5./tLVp4litNyuBy/kfrTsqEv8hiyqEKX0TXIQQwC/5Rm', 'Bruce', 'Scott', 'bruce2@scott.db', '234234234', 'ACTIVE', 'ADMIN');
INSERT INTO address VALUES (UUID_TO_BIN('a731fda1-aaad-42ea-bdbc-a27eeebe2cc0'), '9I-999', 'Fraser Suites Le Claridge', 'Champs-Elysees', 'Paris', 'Île-de-France', 'France', '75008');
insert into user_address values (UUID_TO_BIN('a1b9b31d-e73c-4112-af7c-b68530f38222'), UUID_TO_BIN('a731fda1-aaad-42ea-bdbc-a27eeebe2cc0'));
INSERT INTO card VALUES (UUID_TO_BIN('618ffaff-cbcd-48d4-8848-a15601e6725b'), '999-999-999-999', UUID_TO_BIN('a1b9b31d-e73c-4112-af7c-b68530f38222'), 'User', '12/28', '0000');
insert into cart values (UUID_TO_BIN('cacab31d-e73c-4112-af7c-b68530f38222'), UUID_TO_BIN('a1b9b31d-e73c-4112-af7c-b68530f38222'));
insert into cart values (UUID_TO_BIN('cacab31d-e73c-4112-af7c-b68530f38223'), UUID_TO_BIN('a1b9b31d-e73c-4112-af7c-b68530f38223'));
insert into item values(UUID_TO_BIN('a7384042-e4aa-4c93-85ae-31a346dad702'), UUID_TO_BIN('6d62d909-f957-430e-8689-b5129c0bb75e'), 1, 17.15);
insert into cart_item values (UUID_TO_BIN('cacab31d-e73c-4112-af7c-b68530f38222'), UUID_TO_BIN('a7384042-e4aa-4c93-85ae-31a346dad702'));
insert into item values(UUID_TO_BIN('a7384042-e4aa-4c93-85ae-31a346dad703'), UUID_TO_BIN('d3588630-ad8e-49df-bbd7-3167f7efb246'), 1, 10.99);
insert into cart_item values (UUID_TO_BIN('cacab31d-e73c-4112-af7c-b68530f38222'), UUID_TO_BIN('a7384042-e4aa-4c93-85ae-31a346dad703'));
insert into orders(id, customer_id, address_id, card_id, order_date, total, payment_id, shipment_id, status) values (UUID_TO_BIN('0a59ba9f-629e-4445-8129-b9bce1985d6a'),UUID_TO_BIN('a1b9b31d-e73c-4112-af7c-b68530f38222'), UUID_TO_BIN('a731fda1-aaad-42ea-bdbc-a27eeebe2cc0'), UUID_TO_BIN('618ffaff-cbcd-48d4-8848-a15601e6725b'), current_timestamp, 38.14, NULL, NULL, 'CREATED');
INSERT INTO item VALUES
  (UUID_TO_BIN('a7384042-e4aa-4c93-85ae-31a346dad704'), UUID_TO_BIN('6d62d909-f957-430e-8689-b5129c0bb75e'), 1, 17.15),
  (UUID_TO_BIN('a7384042-e4aa-4c93-85ae-31a346dad705'), UUID_TO_BIN('3395a42e-2d88-40de-b95f-e00e1502085b'), 1, 20.99);
INSERT INTO order_item VALUES
  (UUID_TO_BIN('66682caa-a6d8-46ed-a173-ff822f754e1c'), UUID_TO_BIN('0a59ba9f-629e-4445-8129-b9bce1985d6a'), UUID_TO_BIN('a7384042-e4aa-4c93-85ae-31a346dad704')),
  (UUID_TO_BIN('efeefa71-2760-412a-9ec8-0a040d90f02c'), UUID_TO_BIN('0a59ba9f-629e-4445-8129-b9bce1985d6a'), UUID_TO_BIN('a7384042-e4aa-4c93-85ae-31a346dad705'));
