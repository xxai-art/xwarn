#[cfg(test)]
mod tests {

  use anyhow::Result;
  #[tokio::test]
  async fn main() -> Result<()> {
    xwarn::send("test!").await?;
    Ok(())
  }
}
