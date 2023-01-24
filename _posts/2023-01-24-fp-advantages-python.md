---
title: Functional programming in Python
date: 2023-01-24 00:00:00 +0100
toc_sticky: true
excerpt: Why choosing functional programming over object oriented programming.
categories: reference
tags: FP OOP Python best-practices
---

As a developer who primarily works with **Functional programming (FP)** in my day-to-day projects, I wanted to write a post to share my experience and insights on why I find FP to be a great fit for the kind of work that I do, covering advantages over **Object-Oriented programming (OOP)** and different use cases.

## Properties of FP

FP is a programming paradigm that emphasizes the **use of functions** and **immutable data**. Some of the properties of FP that distinguish it from other programming paradigms include:

* **Immutability:** In FP, data is immutable and cannot be modified once it is created. This helps to make the code more predictable and reduce the risk of bugs caused by unexpected changes to data.

* **Pure functions:** In FP, functions are pure, meaning they have no side effects and always return the same output for the same input. This makes it easy to reason about the behavior of the code and to test it.

* **Declarative programming:** In FP, code is typically more declarative, it describes what the code should do, rather than how it should be done. This makes it easy to understand and maintain.

* **Avoiding shared state:** In FP, it's typical to avoid shared state, this makes it easy to reason about the behavior of the code and to write concurrent and parallel code.

* **Recursion:** FP makes use of recursion as a fundamental control structure, it is used to solve problems by breaking them down into smaller, simpler sub-problems.

* **First-class functions:** Functions are first-class citizens in FP, meaning they can be treated like any other data and can be passed around, composed, and reused.

* **Higher-order functions:** FP makes heavy use of higher-order functions, which are functions that take other functions as arguments or return them as output. This makes it easy to write small, reusable units of code.

## FP vs OOP in Python

In this section, I will be comparing FP and OOP, two popular programming paradigms that are widely used in software development. For that, I prepared some Python using code snippets that will help understanding the key differences between the two approaches and understand when FP is better. 

### Immutability

As mentioned above, immutability helps to **make the code more predictable and reduce the risk of bugs caused by unexpected changes to data.**

**Python example:**

```python
# FP Style
numbers = (1, 2, 3)
squared_numbers = tuple(x**2 for x in numbers)
print(squared_numbers) # Output: (1, 4, 9)

# OOP Style
class Numbers:
    def __init__(self, numbers):
        self.numbers = numbers
    
    def square(self):
        for i in range(len(self.numbers)):
            self.numbers[i] = self.numbers[i]**2

numbers = Numbers([1, 2, 3])
numbers.square()
print(numbers.numbers) # Output: [1, 4, 9]
```

The code above takes a set of numbers and gives back the square of them.
* In the FP version, we have used a tuple to store the numbers, which are immutable and then create a new tuple with the squared numbers using a list comprehension.
* In the OOP version, we have created a class Numbers with an instance variable numbers and a method `square()` that modifies the original list of numbers.

As we can see, **the FP version promotes immutability** and makes it easy to reason about the state of the program, while in the OOP version the data is mutable and it can lead to unexpected changes.

### Predictable and less error-prone

Another advantage is that **FP is more predictable and less error-prone than OOP**. As FP code is typically more declarative, it is easier to understand and maintain. In the other hand, with OOP code can be more complex, as it often relies on hidden state and complex interactions between objects.

**Python example:**

```python
# FP Style
from typing import List

def filter_even_numbers(numbers: List[int]) -> List[int]:
    return list(filter(lambda x: x % 2 == 0, numbers))

even_numbers = filter_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9])
print(even_numbers) # Output: [2, 4, 6, 8]

# OOP Style
class Filter:
    def __init__(self, numbers):
        self.numbers = numbers
        self.even_numbers = []

    def filter_even(self):
        for number in self.numbers:
            if number % 2 == 0:
                self.even_numbers.append(number)

filter_obj = Filter([1, 2, 3, 4, 5, 6, 7, 8, 9])
filter_obj.filter_even()
print(filter_obj.even_numbers) # Output: [2, 4, 6, 8]
```

In this example, both the FP version and the OOP version filter a list of numbers to return only the even numbers.
* The FP version uses the `filter()` function and a **lambda function** to filter the numbers, this makes it easy to understand what the code is doing and makes it easy to test. Also, the **type hints makes it even better.**
* On the other hand, the OOP version uses an instance variable and a for loop to filter the numbers, this can be less predictable and harder to understand, also it can be harder to test it.

As we can see, **the FP version is more declarative and clearly states the intent of the code**, whereas the OOP version can be more complex and harder to understand due to the need to keep track of the state of the object.

### Performance

**FP also tends to be more performant than OOP**, as it does not rely on **runtime polymorphism** (functions getting called on different type of objects), which can slow down code execution. In FP, functions are typically specialized for specific types of data, which makes it possible to optimize their performance.

**Python example:**

```python
# FP Style
import time

def is_prime(n: int) -> bool:
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

def prime_numbers(n: int) -> List[int]:
    return [x for x in range(2,n) if is_prime(x)]

start = time.time()
result = prime_numbers(1000000)
end = time.time()
print(f"Execution Time: {end-start}")

# OOP Style
class PrimeNumbers:
    def __init__(self, n):
        self.n = n
        self.prime_numbers = []

    def is_prime(self, number: int) -> bool:
        if number < 2:
            return False
        for i in range(2, int(number ** 0.5) + 1):
            if number % i == 0:
                return False
        return True

    def get_prime_numbers(self):
        for i in range(2, self.n):
            if self.is_prime(i):
                self.prime_numbers.append(i)
        return self.prime_numbers

start = time.time()
prime_obj = PrimeNumbers(1000000)
result = prime_obj.get_prime_numbers()
end = time.time()
print(f"Execution Time: {end-start}")
```

In this example, both the FP version and the OOP version find prime numbers from `2` to `1000000` . The FP version uses **list comprehension** and a **pure function**, this make the code more performant and optimized for specific types of data, compared to the OOP version which uses a for loop, instance variables and methods, this can be less performant.

### Concurrent and parallel code

In addition, **FP also makes it easier to write concurrent and parallel code**, as it encourages the use of pure functions, which have no side effects and can be safely executed in parallel. On the other hand, OOP code can be more difficult to parallelize, as it often relies on shared state and mutable data.

**Python example:**

```python
# FP Style
from multiprocessing import Pool

def calculate_sum(numbers):
    return sum(numbers)

with Pool(10) as p:
    result = p.map(calculate_sum, [[1,2,3],[4,5,6],[7,8,9]])
    print(result)

# OOP Style
class Sum:
    def __init__(self, numbers):
        self.numbers = numbers
        self.result = 0

    def calculate(self):
        self.result = sum(self.numbers)

sum_obj_1 = Sum([1,2,3])
sum_obj_2 = Sum([4,5,6])
sum_obj_3 = Sum([7,8,9])

sum_obj_1.calculate()
sum_obj_2.calculate()
sum_obj_3.calculate()

print([sum_obj_1.result, sum_obj_2.result, sum_obj_3.result])

```

In the FP version, we are using the Pool class from the multiprocessing module to map the `calculate_sum()` function over a list of lists containing numbers, this allows to calculate the sum of these numbers in parallel.

In the OOP version, we are creating three instances of the Sum class and calling the `calculate()` method on each of them, this can be less performant than the FP version because it doesn't allow for true parallelization.

### Easy to write small, reusable units of code

```python
# FP Style
def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    return x / y

operations = {
    'add': add,
    'subtract': subtract,
    'multiply': multiply,
    'divide': divide
}

print(operations['add'](5, 3)) # Output: 8

# OOP Style
class Calculator:
    def add(self, x, y):
        return x + y
    
    def subtract(self, x, y):
        return x - y
    
    def multiply(self, x, y):
        return x * y
    
    def divide(self, x, y):
        return x / y

calculator = Calculator()
print(calculator.add(5, 3)) # Output: 8
```

In the FP version, we have defined four separate functions for different operations, and then store them in a dictionary. This makes it easy to write small, reusable units of code and compose them in different ways.

On the other hand, in the OOP version, we have created a class Calculator with four methods that perform the same operations. While the OOP version also allows for the reuse of code, it is less flexible than the FP version and requires the creation of an object.

## Use cases

Here are some real-world scenarios in which FP is a better choice over OOP:

* **Data pipelining:** In data science, it is often necessary to process large amounts of data through a series of steps. FP is well suited for this task, as it makes it easy to write small, reusable units of code that can be composed together to form a pipeline. Using a functional style, we can chain together multiple functions that perform different steps of the pipeline, making it easy to understand and maintain the code.
* **Concurrent and parallel programming:** FP's ability to write concurrent and parallel code makes it a good choice for tasks that require high performance and scalability. By using pure functions and immutable data, it's possible to safely execute multiple functions in parallel, making the most of multi-core processors and distributed systems.
* **Financial calculations:** In financial industry, the calculations are mostly based on mathematical functions and are done on large sets of data. FP's immutability and its ability to compose small functions make it a good choice for this domain.
* **Reactive programming:** Reactive programming is a programming paradigm that is based on reacting to changes in the system and updating the user interface accordingly. FP makes it easy to write code that is responsive to changes and updates, by using functional reactive programming (FRP) libraries and techniques.
* **Event-driven systems:** Event-driven systems are systems that respond to events, such as user inputs or sensor readings. FP's ability to write small, reusable units of code and its ability to handle concurrency make it a good choice for event-driven systems.

## Conclusion

In conclusion, while both FP and OOP have their own set of advantages and disadvantages, many developers argue that FP is generally a better choice, as it promotes immutability, makes it easy to write small, reusable units of code, is more predictable and less error-prone, more performant, and makes it easier to write concurrent and parallel code. However, it is important to note that the choice between FP and OOP often depends on the specific requirements of a project.

**Note:** This post was created with the help of ChatGPT, but it is crucial to recognize that the technology only assisted in its generation. The final structure, ideas, and accuracy of the content are all determined and reviewed by the author.
{: .notice--info}
