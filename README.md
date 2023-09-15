# xwarn

用 [wxpusher](https://wxpusher.zjiecode.com) 发送微信报警

send weixin warn use https://wxpusher.zjiecode.com

[→ tests/main.rs](tests/main.rs)

```rust
use anyhow::Result;

#[tokio::test]
async fn main() -> Result<()> {
  xwarn::send("test!").await?;
  Ok(())
}
```


run

[→ out.txt](out.txt)

```txt

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s


running 1 test
test main ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.19s


running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

```

