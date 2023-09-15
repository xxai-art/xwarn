use std::{any, env};

use anyhow::Result;
use lazy_static::lazy_static;
use serde_json::json;

const WXPUSH_URL: &str = "http://wxpusher.zjiecode.com/api/send/message";

lazy_static! {
  static ref ID: String = env::var("WXPUSH_TOPIC_ID").expect("WXPUSH_TOPIC_ID is not set");
  static ref TOKEN: String = env::var("WXPUSH_TOKEN").expect("WXPUSH_TOKEN is not set");
}

pub async fn send(summary: impl AsRef<str>) -> Result<()> {
  let summary = summary.as_ref();
  let body = json!({
      "appToken": *TOKEN,
      "summary": format!("xxai.art · {}", summary),
      "content": summary,
      "topicIds": [*ID],
      "url": ""
  });
  let client = reqwest::Client::new();
  let res = client
    .post(WXPUSH_URL)
    .header("content-type", "application/json")
    .body(body.to_string())
    .send()
    .await?;
  dbg!(res);
  Ok(())
}
