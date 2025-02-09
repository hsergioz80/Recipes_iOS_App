# Recipes_iOS_App
Fetch's mobile take home project


https://github.com/user-attachments/assets/36f5b937-bccd-44c6-b213-ccb0ddd4cccb

![Screenshot 2025-02-08 at 5 09 02 PM](https://github.com/user-attachments/assets/f01e0adf-8736-430b-b947-8275ffe5b24f)
![Screenshot 2025-02-08 at 5 08 22 PM](https://github.com/user-attachments/assets/77f10a6c-e0df-4216-a82b-6b25498bb265)


https://github.com/user-attachments/assets/db0cd776-590d-43d6-8306-0bf5977e570a



Focus Areas: I prioritized image caching, the user interface, and code structure in the project. I focused on image caching first because I had no prior experience using FileManager for this purpose, and I wanted to tackle the more challenging aspect upfront to ensure I fully understood it. The user interface was a key focus because, while all candidates were working with the same data, we had the freedom to present it creatively. I wanted to demonstrate my ability to make data visually appealing, even without a predefined design. Lastly, I prioritized code structure because I wanted to showcase my approach to writing production-ready, maintainable code that adheres to best practices.

Time Spent: I spent about 6 hours working on this project. The time was allocated as follows:
Implementation of User interface = 1Hr
Implementation of Unit testing = 1Hr
Implementation of Recipe Data Structure and information retrieval = 1Hr
Implementation of Image Caching = 1.5Hr
Code Refactoring = .5Hr
Researching Information Online 2hrs

Trade offs: I made a deliberate trade-off to optimize for readability by consolidating all image caching functions into a single file. The decision to store large images only on disk, rather than both in memory and on disk, was intentional. I believed that larger images would better showcase the food, improving the user experience, even though they consume more memory and load slower. The benefits of clearer, more detailed images far outweighed the negligible increase in load time.

Weakest Part of the Project: The weakest part of my project is the time it took me to complete it. Initially, I implemented image caching using URLCache, which was working well, but I wasn't sure if it met the restriction of not using URLSession's HTTP caching, so I switched to using FileManager instead. Additionally, I didn't implement a function to delete cached images when refreshing. While this didn’t impact the overall functionality, it’s something I would refine for a more robust solution. Lastly my unit tests could have tested for more scenarios.

Additional Information: Thank you for offering a different type of interview experience. I was excited to tackle this take-home assessment and found it incredibly rewarding. While it took more time than a typical Leetcode-style interview, I gained valuable insights, created a reusable image caching solution, and now have a new project to showcase on my GitHub.
