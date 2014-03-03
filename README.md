A lovingly rendered version of Facebook

###Models:

**User:** Everything goes through here, including authentication. 
Friendships are between Users, Messages are between Users, Comments are liked by Users, etc.

**Profile:** Most user info is stored here, except for the email which is used to uniquely identify users. There are helper methods to more easily pull out name and photo when necessary.

**Status, Comment, PhotoComment, and Like**: Statuses, Comments, and PhotoComments are all polymorphically Posts. Statuses are posted by a user on her own page. Comments are posted by a user on someone else's page. A PhotoComment is made upon the uploading of a photo; there is only one per photo.

**Reply**: Replies have a polymorphic parent, which can be a Status, Comment, or PhotoComment.

**Like**: Likes work exactly the same way with Statuses, Comments, PhotoComments, and Replies.

**PendingFriendship and Friendship**: PendingFriendships are created when a friend request is sent, and destroyed when the request is accepted or rejected. It distinguishes between the sender and the receiver. Friendships are created when a friend request is accepted; while the setup is similarly asymmetric to PendingFriendships, in the end we refer to user.all_friends, which is symmetric.

**Message, MessageThread, and UserMessageThread**: A message thread contains many messages. Distinction is made between the sender and recipients; this changes pictures and words that are shown on the page, depending on whom we're logged in as.

**Photo and PhotoTagging**: A photo has an uploader, as well as people tagged. Users can untag themselves, but the uploader can tag and untag anyone.

###Controllers:

**Demo-anything**: This has to do with a simulated demo user, so that tedious tasks like filling in forms, making some friends, and being tagged in some photos can be handled quickly. Otherwise, we'd need to be logging in and logging out to get a basic taste of the site's functionality.

**Sessions, Application**: Standard authentication.

**Notifications**: Collects a whole lot of data from other models to have a constantly updating notification page that deals with relevant events in the last week.

**SearchResults**: Uses pg-search to search for users by first and last name. Search bar drops down dynamically thanks to JS.

###Views:

**Profiles**: The '_form' partial is the hub of the logic here.

**Helpers**: Some important ones include the top bar that is always shown, the second-to-top bars that vary depending on whose page we're on, and the ubiquitous name and face that show up just about everywhere.

Enjoy using the site, and tell me if there's anything I should know!

-Andre Kuney


