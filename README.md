SchoolGradingSystem Smart Contract:

The SchoolGradingSystem is a smart contract written in Solidity for managing student records and their grades. The contract allows the owner to add, update, and delete student records. Additionally, it includes error handling using require, revert, and assert statements to ensure data integrity and proper function execution.

Contract Structure State Variables nextId: An unsigned integer to keep track of the next student ID. owner: An address representing the owner of the contract (the only entity allowed to perform certain actions). students: A mapping from student ID to Student struct. Structs Student: A struct containing: id: The unique identifier for the student. name: The name of the student. grade: The grade of the student (0-100). Events StudentAdded(uint id, string name): Emitted when a new student is added. GradeUpdated(uint id, uint8 grade): Emitted when a student's grade is updated. StudentDeleted(uint id, string name): Emitted when a student is deleted. Modifiers onlyOwner: Ensures that only the owner can call the function. validGrade(uint8 grade): Ensures that the grade is between 0 and 100. studentExists(uint id): Ensures that the student with the given ID exists. Functions Constructor solidity Copy code constructor() { owner = msg.sender; } Sets the contract deployer as the owner.

Public Functions addStudent(string memory name) public onlyOwner

Adds a new student with the given name and emits the StudentAdded event. updateGrade(uint id, uint8 grade) public onlyOwner studentExists(id) validGrade(grade)

Updates the grade of the student with the given ID and emits the GradeUpdated event. getStudent(uint id) public view studentExists(id) returns (string memory name, uint8 grade)

Returns the name and grade of the student with the given ID. deleteStudent(uint id) public onlyOwner studentExists(id)

Deletes the student with the given ID and emits the StudentDeleted event. Utility Functions revertExample(uint8 grade) public pure

Demonstrates the use of revert by throwing an error if the grade is greater than 100. assertExample(uint id) public view

Demonstrates the use of assert by ensuring that nextId is greater than the given ID. Error Handling The contract includes several error-handling mechanisms:

require: Used to check conditions before executing the function. If the condition fails, it reverts the transaction. revert: Used to revert the transaction with an error message. assert: Used to ensure that certain conditions are always true. If the condition fails, it indicates a bug in the code.
