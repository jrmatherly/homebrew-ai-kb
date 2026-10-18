# homebrew-ai-kb

Homebrew tap and Scoop bucket for [AI KB](https://github.com/jrmatherly/ai-kb): the `aikb` command-line client and the `ai-kb-lite` single-binary server.

```bash
brew install jrmatherly/ai-kb/aikb        # the CLI
brew install jrmatherly/ai-kb/ai-kb-lite  # the Lite server
```

```powershell
scoop bucket add ai-kb https://github.com/jrmatherly/homebrew-ai-kb
scoop install ai-kb/aikb
```

Every file here is written by the `release-lite` workflow of `jrmatherly/ai-kb` on each product release, committed as `ai-kb-tap-publisher[bot]`. `Formula/aikb.rb` and `bucket/aikb.json` carry placeholder hashes until the first release that ships `aikb` archives; the Scoop workflow skips its install step while they do.
