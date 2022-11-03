create table Addreses(
AddressID int PRIMARY KEY identity(1,1),
Contry nvarchar(40) default 'Syria',
City nvarchar(40) not null,
Notes nvarchar(200) default 'Syria',
)
create table Contactss(
ContactID int PRIMARY KEY identity(1,1),
PhoneNumber1 varchar(20) not null,
PhoneNumber2 varchar(20) ,
Email varchar(50) not null,
)
create table Roles(
RoleID int PRIMARY KEY identity(1,1),
RoleName nvarchar(100) not null,
)
create table Users(
UserID int PRIMARY KEY identity(1,1),
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
UserName varchar(20) not null unique,
Password varchar(10) not null ,
ContactID int,
RoleID int,
AddressID int,
foreign key (ContactID) references Contacts(ContactID),
foreign key (RoleID) references Roles(RoleID),
foreign key (AddressID) references Addresses(AddressID),
)
create table Supervisors(
SupervisorID int PRIMARY KEY identity(1,1),
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
UserID int,
foreign key (UserID) references Users(UserID),
)
create table Universitys(
UniversityID int PRIMARY KEY identity(1,1),
UnName nvarchar(20) not null,
AcademicYear nvarchar(20) not null,
)



create table Projects(
ProjectID  int PRIMARY KEY identity(1,1),
NameProject nvarchar(40) not null,
Link nvarchar(40) not null,
)
create table Company(
CompanyID  int PRIMARY KEY identity(1,1),
ComapanyName nvarchar (40),
)
create table Quizes(
QuizID  int PRIMARY KEY identity(1,1),
QuizMark int check (QuizMark >0 ),
EnrollmentID int,
foreign key (EnrollmentID) references Enrollments(EnrollmentID),
)
create table Feedbacks(
FeedbackID  int PRIMARY KEY identity(1,1),
AssignedID int,
foreign key (AssignedID) references Assigneds(AssignedID),
QuizID int,
foreign key (QuizID) references Quizes(QuizID),
)
create table Experiences(
ExperienceID  int PRIMARY KEY identity(1,1),
ProjectID int,
foreign key (ProjectID) references Projects(ProjectID),
CompanyID int,
foreign key (CompanyID) references Company(CompanyID),
FeedbackID int,
foreign key (FeedbackID) references Feedbacks(FeedbackID),
)


create table Students(
StudentID int PRIMARY KEY identity(1,1),
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
registrationDate date,
IsEmployed varchar(20) check(IsEmployed in ('true','false')),
UserID int,
UniversityID int,
ExperienceID int,
foreign key (UserID) references Users(UserID),
foreign key (UniversityID) references Universitys(UniversityID),
foreign key (ExperienceID) references Experiences(ExperienceID),
)

create table Instructors(
InstructorID int PRIMARY KEY identity(1,1),
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
Qualification varchar(20),
InstroductionBrief nvarChar (100),
AvergeReviewRating varchar(10),
UserID int,
foreign key (UserID) references Users(UserID),
)

create table Courses(
CourseID  int PRIMARY KEY identity(1,1),
CourseTitel nvarchar(20) not null,
CourseBrief nvarchar (100) not null,
StartingDate date,
EpriryDate date,
InstructorID int,
foreign key (InstructorID) references Instructors(InstructorID),
)

create table Assignments(
AssignmentID  int PRIMARY KEY identity(1,1),
TimeCreated date,
AssignmentDesc nvarchar(50),
Instuction nvarchar (40),
)

create table Enrollments(
EnrollmentID  int PRIMARY KEY identity(1,1),
EnrollmentDate date not null,
IsCompleted varchar check(IsCompleted in ('true','false')),
StudentID int,
CourseID int,
foreign key (StudentID) references Students(StudentID),
foreign key (CourseID) references Courses(CourseID),
)

create table Assigneds(
 AssignedID  int PRIMARY KEY identity(1,1),
 QuizMark int check (QuizMark >0 ),
 AssignmentID int,
 foreign key (AssignmentID) references Assignments(AssignmentID),
 EnrollmentID int,
 foreign key ( EnrollmentID) references Enrollments(EnrollmentID),
)
create table CoursesChapter(
CoursChapterID  int PRIMARY KEY identity(1,1),
NumberAssignment int,
NumberVideo int,
CourseID int,
foreign key (CourseID) references Courses(CourseID),
)

create table Contracts(
ContractID int PRIMARY KEY identity(1,1),
StartingDate date,
JobTitel nvarchar(40),
Duration varchar(20),
Salary int,
CompanyID int,
foreign key (CompanyID) references Company(CompanyID),
)







