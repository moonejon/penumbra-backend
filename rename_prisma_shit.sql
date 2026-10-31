alter index "AppSettings_pkey" rename to app_settings_pkey;
alter index "BookInReadingList_bookId_idx" rename to book_in_reading_list_book_id_idx;
alter index "BookInReadingList_bookId_readingListId_key" rename to book_in_reading_list_book_id_reading_list_id_key;
alter index "BookInReadingList_pkey" rename to book_in_reading_list_pkey;
alter index "BookInReadingList_readingListId_position_idx" rename to book_in_reading_list_reading_list_id_position_idx;
alter index "Book_isbn10_key" rename to book_isbn10_key;
alter index "Book_isbn13_key" rename to book_isbn13_key;
alter index "Book_ownerId_idx" rename to book_owner_id_idx;
alter index "Book_ownerId_readDate_idx" rename to book_owner_id_read_date_idx;
alter index "Book_readDate_idx" rename to book_read_date_idx;
alter index "Book_title_idx" rename to book_title_idx;
alter index "Book_visibility_idx" rename to book_visibility_idx;
alter index "ReadingList_ownerId_idx" rename to reading_list_owner_id_idx;
alter index "ReadingList_pkey" rename to reading_list_pkey;
alter index "ReadingList_type_idx" rename to reading_list_type_idx;
alter index "ReadingList_type_year_idx" rename to reading_list_type_year_idx;
alter index "ReadingList_visibility_idx" rename to reading_list_visibility_idx;
alter index "User_clerkId_key" rename to app_user_clerk_id_key;
alter index "User_email_key" rename to app_user_email_key;
alter index "User_pkey" rename to app_user_pkey;

alter sequence "BookInReadingList_id_seq" rename to book_in_reading_list_id_seq;
alter sequence "Book_id_seq" rename to book_id_seq;
alter sequence "ReadingList_id_seq" rename to reading_list_id_seq;
alter sequence "User_id_seq" rename to app_user_id_seq;

alter type "BookVisibility" rename to book_visibility;
alter type "ReadingListType" rename to reading_list_type;
alter type "ReadingListVisibility" rename to reading_list_visibility;

alter table book rename constraint "Book_ownerId_fkey" to book_owner_id_fkey;
alter table book_in_reading_list rename constraint "BookInReadingList_bookId_fkey" to book_in_reading_list_book_id_fkey;
alter table book_in_reading_list rename constraint "BookInReadingList_readingListId_fkey" to book_in_reading_list_reading_list_id_fkey;
alter table reading_list rename constraint "ReadingList_ownerId_fkey" to reading_list_owner_id_fkey;

drop index book_isbn10_key;
drop index book_isbn13_key;
create unique index book_owner_isbn13_key on book (owner_id, isbn13);
create index book_isbn10_idx on book (isbn10);

drop table _prisma_migrations;