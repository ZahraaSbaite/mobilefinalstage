import 'package:final_project/models/course.dart';
import '../models/category.dart';

final List<Category> dummyCategories = [
  Category(
    id: 'c1',
    name: 'Remedial',
    courses: [
      Course(
        code: 'ARB100',
        title: 'Arabic Remedial course',
        description:
            'Focuses on strengthening basic Arabic language skills in reading, writing, and grammar.',
      ),
      Course(
        code: 'EBG100',
        title: 'English Remedial Course',
        description:
            'Strengthens foundational English skills in grammar, writing, and reading.',
      ),
      Course(
        code: 'MAT203',
        title: 'Remedial Calculas',
        description:
            'Covers foundational calculus concepts to prepare students for higher-level math courses.',
      ),
    ],
  ),
  Category(
    id: 'c2',
    name: 'GER',
    courses: [
      Course(
        code: 'ARB201',
        title: 'Arabic Communication Skills I',
        description:
            'Focuses on developing advanced Arabic writing, reading, and communication skills.',
      ),
      Course(
        code: 'CST200',
        title: 'Culture Studies',
        description:
            'Explores culture, identity, and society through interdisciplinary perspectives.',
      ),
      Course(
        code: 'ENG201',
        title: 'English Communication Skills I',
        description:
            'Enhances academic English writing, reading, and speaking proficiency.',
      ),
      Course(
        code: 'ENG202',
        title: 'English Communication Skills II',
        description:
            'Builds on ENG201 with a focus on research writing and critical reading.',
      ),
      Course(
        code: 'ENG204',
        title: 'Public Speaking',
        description:
            'Trains students in effective oral communication and presentation skills.',
      ),
      Course(
        code: 'FOE201',
        title: 'Intro to Computing',
        description:
            'Covers fundamental computer science concepts and digital literacy.',
      ),
    ],
  ),
  Category(
    id: 'c3',
    name: 'Free Science Elective',
    courses: [
      Course(
        code: 'CHE205',
        title: 'General Chemistry',
        description:
            'Introduces principles of general chemistry including atomic structure and chemical reactions.',
      ),
      Course(
        code: 'PHY220',
        title: 'Electricity And Magnetisim',
        description:
            'Covers electric and magnetic fields, circuits, and electromagnetic theory fundamentals.',
      ),
    ],
  ),
  Category(
    id: 'c4',
    name: 'Other',
    courses: [
      Course(
        code: 'COE325L',
        title: 'Microprocessor Lab',
        description:
            'Hands-on experiments with microprocessors, focusing on programming, interfacing, and hardware control.',
      ),
      Course(
        code: 'CSC310L',
        title: 'Object Oriented Programming Lab',
        description:
            'Lab support for OOP course using real-world coding problems.',
      ),
      Course(
        code: 'CSC320L',
        title: 'Data Structure Lab',
        description:
            'Applies data structure theory through implementation and coding exercises.',
      ),
    ],
  ),
  Category(
    id: 'c5',
    name: 'Major',
    courses: [
      Course(
        code: 'COE360',
        title: 'Computer Networks',
        description:
            'Covers the fundamentals of data communication, protocols, and network architectures.',
      ),
      Course(
        code: 'COE360L',
        title: 'Computer Networks Lab',
        description:
            'Hands-on lab sessions reinforcing networking concepts and configurations.',
      ),
      Course(
        code: 'COE380',
        title: 'Computer Organization',
        description:
            'Explains computer architecture, memory, CPU operations, and instruction sets.',
      ),
      Course(
        code: 'CSC210',
        title: 'C++ Programming',
        description:
            'Introduces programming in C++ with problem-solving and logic development.',
      ),
      Course(
        code: 'CSC210L',
        title: 'C++ Programming Lab',
        description:
            'Practical implementation of C++ programming concepts.',
      ),
      Course(
        code: 'CSC310',
        title: 'Object Oriented Programming',
        description:
            'Focuses on OOP concepts such as inheritance, polymorphism, and encapsulation.',
      ),
      Course(
        code: 'CSC320',
        title: 'Data Structures',
        description:
            'Teaches data organization, manipulation, and algorithms using various structures.',
      ),
      Course(
        code: 'CSC330',
        title: 'Database Systems',
        description:
            'Introduces relational databases, SQL, and database design.',
      ),
      Course(
        code: 'CSC330L',
        title: 'Database Systems Lab',
        description:
            'Practical exercises in database development and query execution.',
      ),
      Course(
        code: 'CSC340',
        title: 'Theory of Computation',
        description:
            'Explores automata, formal languages, grammars, and computability theory.',
      ),
      Course(
        code: 'CSC400',
        title: 'Web Programming',
        description:
            'Covers front-end and back-end web development using modern tools and languages.',
      ),
      Course(
        code: 'CSC420',
        title: 'Algorithms',
        description:
            'Studies algorithm design, complexity, and optimization techniques.',
      ),
      Course(
        code: 'CSC450',
        title: 'Operating Systems',
        description:
            'Explains OS concepts including processes, memory, and file systems.',
      ),
      Course(
        code: 'CSC470',
        title: 'Software Engineering',
        description:
            'Covers software development lifecycle, modeling, and project management.',
      ),
      Course(
        code: 'CSC497',
        title: 'Practical Training',
        description:
            'Internship or fieldwork providing industry experience.',
      ),
      Course(
        code: 'CSC498',
        title: 'Capstone Project Proposal',
        description:
            'Initial proposal and planning for the final-year software project.',
      ),
      Course(
        code: 'CSC499',
        title: 'Capstone Project',
        description:
            'Execution and presentation of a substantial software development project.',
      ),
      Course(
        code: 'EEE225',
        title: 'Digital Logic Design',
        description:
            'Studies logic gates, combinational/ sequential circuits, and digital systems.',
      ),
      Course(
        code: 'EEE225L',
        title: 'Digital Logic Design Laboratory',
        description:
            'Practical application of digital logic concepts using simulation and hardware.',
      ),
    ],
  ),
  Category(
    id: 'c6',
    name: 'Liberal Arts Elective',
    courses: [
      Course(
        code: 'COM214',
        title: 'Digital Applications Skills',
        description:
            'Covers essential digital tools, including Photoshop, video editing, and basic productivity applications.',
      ),
      Course(
        code: 'CST201',
        title:
            'Introduction to Cultural Studies II: Community Culture',
        description:
            'Examines community traditions and identity formation.',
      ),
      Course(
        code: 'CST202',
        title:
            'Introduction to Cultural Studies III: Contemporary Issues',
        description:
            'Discusses modern social, cultural, and political challenges.',
      ),
      Course(
        code: 'ACC210',
        title: 'Financial Accounting',
        description:
            'Covers the principles and procedures for recording, summarizing, and reporting financial transactions.',
      ),
      Course(
        code: 'MKT201',
        title: 'Marketing Principals',
        description:
            'Introduction to basic marketing concepts, strategies, and practices used to deliver value to customers.',
      ),
      Course(
        code: 'PRS200',
        title: 'Persian Language',
        description:
            'Focuses on developing proficiency in reading, writing, and speaking the Persian language.',
      ),
      Course(
        code: 'SOC200',
        title: 'Introduction to Sociology',
        description:
            'Examines human society, social behavior, and the structures and functions of social institutions.',
      ),
      Course(
        code: 'ECO201',
        title: 'Microeconomics',
        description:
            'Analyzes individual decision-making, markets, and consumer behavior.',
      ),
    ],
  ),
  Category(
    id: 'c7',
    name: 'Technical Elective',
    courses: [
      Course(
        code: 'CSC415',
        title: 'Mobile Application Development',
        description:
            'Introduces mobile app development for Android/iOS platforms.',
      ),
      Course(
        code: 'CSC456',
        title: 'Image Processing',
        description:
            'Covers image manipulation, filtering, and enhancement techniques.',
      ),
      Course(
        code: 'CSC458',
        title: 'Artificial Intelligence',
        description:
            'Introduces Al concepts including search algorithms, logic, and machine learning.',
      ),
      Course(
        code: 'CSC465',
        title: 'Computer Security',
        description:
            'Explores methods to protect computer systems from threats, vulnerabilities, and cyber attacks.',
      ),
      Course(
        code: 'CSC430',
        title: 'Software Aechitecture',
        description:
            'Focuses on the design and structure of software systems, emphasizing architectural patterns and best practices.',
      ),
      Course(
        code: 'CSC475',
        title: 'Games Proccesing',
        description:
            'Introduces game development concepts, including game engines, graphics, and real-time processing.',
      ),
      Course(
        code: 'CSC435',
        title: 'Blockchain Technologies',
        description:
            'Covers the fundamentals of blockchain, including decentralized systems, cryptography, and smart contracts.',
      ),
    ],
  ),
  Category(
    id: 'c8',
    name: 'Mathematics Requirement',
    courses: [
      Course(
        code: 'MAT213',
        title: 'Calculus III',
        description:
            'Covers multivariable calculus, partial derivatives, and triple integrals.',
      ),
      Course(
        code: 'MAT225',
        title: 'Probability and Statistics for Science',
        description:
            'Introduces statistical methods and probability theory for scientific applications.',
      ),
      Course(
        code: 'MAT250',
        title: 'Discrete Mathematics',
        description:
            'Focuses on logic, set theory, graph theory, and combinatorics.',
      ),
      Course(
        code: 'MAT320',
        title: 'Linear Algebra',
        description:
            'Studies matrices, vector spaces, and linear transformations.',
      ),
      Course(
        code: 'MAT350',
        title: 'Numerical Analysis',
        description:
            'Covers numerical methods for solving mathematical problems computationally',
      ),
    ],
  ),
];
