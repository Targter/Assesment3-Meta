// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGradingSystem {
    struct Student {
        uint id;
        string name;
        uint8 grade; 
    }

    mapping(uint => Student) private students;
    uint private nextId = 1;
    address private owner;

    event StudentAdded(uint id, string name);
    event GradeUpdated(uint id, uint8 grade);
    event StudentDeleted(uint id, string name);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    modifier validGrade(uint8 grade) {
        require(grade <= 100, "Grade must be between 0 and 100");
        _;
    }

    modifier studentExists(uint id) {
        require(bytes(students[id].name).length != 0, "Student does not exist");
        _;
    }

    function addStudent(string memory name) public onlyOwner {
        students[nextId] = Student(nextId, name, 0);
        emit StudentAdded(nextId, name);
        nextId++;
    }

    function updateGrade(uint id, uint8 grade) public onlyOwner studentExists(id) validGrade(grade) {
        students[id].grade = grade;
        emit GradeUpdated(id, grade);
    }

    function getStudent(uint id) public view studentExists(id) returns (string memory name, uint8 grade) {
        Student memory student = students[id];
        return (student.name, student.grade);
    }

    function deleteStudent(uint id) public onlyOwner studentExists(id) {
        string memory studentName = students[id].name;
        delete students[id];
        emit StudentDeleted(id, studentName);
    }

    
    function revertExample(uint8 grade) public pure {
        if (grade > 100) {
            revert("Grade must be between 0 and 100");
        }
    }

    function assertExample(uint id) public view {
       
        assert(nextId > id);
    }
}
