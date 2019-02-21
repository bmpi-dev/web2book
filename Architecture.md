# Architecture
                                       +-----------+
               +------+     +----+     | Golang    |
               |      |     |    +<----+ Storager  | D
               |      |     |    |     +-----------+
               |      |     |    |     +-----------+
               |Elixir|     |    |     | Rust      | E
               | Web  +---->+    +<----+ PDFMaker  |  
               |      |     |    |     +-----------+  
               |      |     |    |     +-----------+         +-------+
               |      |     |    |     |           |         |       |
               +------+     | MQ +<---+| Elixir    +-------->+ Redis | H
                  A         |    |     | Scheduler | F       |       |
                            |    |     |           |         +-------+
               +------+     |    |     +-----------+          
               |      |     |    |     +--------------------------------------------------------------+
               | CL   |     |    |     | +-------+   +--------+   +---------+  +---------+ +--------+ |
               | Email+---->+    +<----+ |       |   | Html   |   |  Html   |  | Html    | |        | |
               |      |     |    |     | |Git2pdf|   |Parser1 |   | Parser2 |  |Parser3  | | .....  | |
               |      |     |    |     | |       |   |        |   |         |  |         | |        | |
               |      |     |    |     | +-------+   +--------+   +---------+  +---------+ +--------+ |
               +------+     +----+     +--------------------------------------------------------------+
                  B           C                                       G
                                                                       
## Module A                                                      
Our front websites which receive user's URL and email.
         
## Module B
Our email notification system. It will send a email to user when our system done with a PDF download path.
         
## Module C
Our message queue. It is a bridge for distributed system.

## Module D
Our storager which can save pdf to Qiniu cloud storage.

## Module E
Our PDF maker which can parse html to pdf.

## Module F
Our core scheduler, it can balance our system load and dispatch user's tasks to different nodes in our cluster. Also it can limit the crawler request rate in same website (Rate Limiter).

## Module G
Our html parser, it will adapt different websites such as wordpress-like, medium, blog-like and crawl websites to fetch html content.

## Module H
Our k-v storage which can used be a rate limiter.

