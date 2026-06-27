<script lang="ts">
	import { onMount } from 'svelte';

	type Platform = 'macos' | 'linux' | 'windows' | 'unknown';

	let detectedPlatform: Platform = 'unknown';
	let showOther = false;

	const MAC_DMG = '/downloads/Waves-aarch64.dmg';
	const GH_LATEST = 'https://github.com/saravenpi/waves/releases/latest/download';

	const otherPlatforms = [
		{ id: 'linux', name: 'Linux', detail: 'x86_64 · .tar.gz', file: 'waves-linux-x86_64.tar.gz' },
		{ id: 'windows', name: 'Windows', detail: 'x86_64 · .zip', file: 'waves-windows-x86_64.zip' },
		{ id: 'macos-intel', name: 'Intel Mac', detail: 'x86_64 · .dmg', file: 'waves-macos.dmg' }
	];

	onMount(() => {
		const ua = navigator.userAgent.toLowerCase();
		const plat = (navigator.platform || '').toLowerCase();
		if (ua.includes('mac') || plat.includes('mac')) detectedPlatform = 'macos';
		else if (ua.includes('linux') || plat.includes('linux')) detectedPlatform = 'linux';
		else if (ua.includes('win') || plat.includes('win')) detectedPlatform = 'windows';
	});

	const features = [
		{
			label: 'browser',
			title: 'Miller-column browser',
			desc: 'Cascade through your library column by column. Fast, keyboard-first navigation that never makes you lose your place.'
		},
		{
			label: 'visualizers',
			title: 'Real-time FFT',
			desc: 'Four live visualization modes — spectrum, waveform, circle and more — driven by an FFT engine reacting to every beat.'
		},
		{
			label: 'spectrum',
			title: '64-band analyzer',
			desc: 'A 64-band spectrum analyzer and a waveform display tracking playback progress with frame-accurate precision.'
		},
		{
			label: 'formats',
			title: 'Broad format support',
			desc: 'Plays MP3, FLAC, WAV, OGG and M4A out of the box. Your collection, untouched and uncompressed.'
		},
		{
			label: 'metadata',
			title: 'Metadata & favorites',
			desc: 'Edit tags in place with cover-art preservation, and star the tracks you live on with the favorites system.'
		},
		{
			label: 'keys',
			title: 'Vim-style navigation',
			desc: 'h / j / k / l movement, modal controls and shortcuts for everything. Hands stay on the home row.'
		}
	];
</script>

<svelte:head>
	<title>Waves — a music player that listens back</title>
	<meta
		name="description"
		content="Waves is a minimalist, local-only music player with real-time audio visualizers and vim-style navigation. No cloud, no accounts."
	/>
</svelte:head>

<main>
	<header class="topbar fade-in">
		<a class="brand" href="/" aria-label="Waves home">
			<img src="/logo.svg" alt="" class="brand-mark" />
			<span class="brand-name">Waves</span>
		</a>
		<nav class="topnav">
			<a href="/shortcuts">shortcuts</a>
			<a href="https://github.com/saravenpi/waves" target="_blank" rel="noopener">github</a>
		</nav>
	</header>

	<section class="hero">
		<div class="hero-glow" aria-hidden="true"></div>

		<h1 class="wordmark fade-in delay-1">Waves</h1>
		<p class="tagline fade-in delay-2">A music player that listens back.</p>
		<p class="subtagline fade-in delay-2">
			Local-first. Real-time visualizers. No cloud, no accounts — just your library.
		</p>

		<div class="cta fade-in delay-3">
			<a class="download" href={MAC_DMG} download>
				<svg viewBox="0 0 24 24" width="20" height="20" aria-hidden="true"
					><path
						fill="currentColor"
						d="M16.365 1.43c0 1.14-.42 2.205-1.12 2.99c-.78.875-2.04 1.55-3.04 1.47c-.13-1.1.42-2.27 1.07-2.99c.74-.815 2.04-1.43 3.09-1.47M20.5 17.06c-.55 1.28-.82 1.85-1.53 2.98c-.99 1.58-2.38 3.54-4.1 3.55c-1.53.02-1.93-.99-4-.98c-2.07.01-2.5 1-4.04.97c-1.72-.01-3.04-1.78-4.03-3.36c-2.78-4.42-3.07-9.6-1.36-12.35c1.22-1.95 3.14-3.1 4.95-3.1c1.84 0 3 1 4.52 1c1.47 0 2.37-1 4.5-1c1.61 0 3.32.88 4.54 2.4c-3.99 2.18-3.34 7.88.55 9.29"
					/></svg
				>
				<span class="download-text">
					<span class="download-main">Download for Mac</span>
					<span class="download-sub">Apple Silicon · .dmg</span>
				</span>
			</a>
			<p class="cta-note">macOS 11+ · Apple Silicon · free &amp; open source</p>

			<button class="other-toggle" on:click={() => (showOther = !showOther)} aria-expanded={showOther}>
				{showOther ? '− hide other platforms' : '+ other platforms'}
			</button>

			{#if showOther}
				<div class="other-grid">
					{#each otherPlatforms as p}
						<a class="other-link" class:detected={detectedPlatform === p.id} href={`${GH_LATEST}/${p.file}`} download>
							<span class="other-name">
								{p.name}
								{#if detectedPlatform === p.id}<span class="tag">detected</span>{/if}
							</span>
							<span class="other-detail">{p.detail}</span>
						</a>
					{/each}
				</div>
			{/if}
		</div>
	</section>

	<section class="features">
		<div class="section-head fade-in">
			<span class="kicker">// features</span>
			<h2>Built for people who actually listen.</h2>
		</div>
		<div class="feature-grid">
			{#each features as f, i}
				<article class="feature fade-in" style="animation-delay:{0.05 * i}s">
					<span class="feature-label">{f.label}</span>
					<h3>{f.title}</h3>
					<p>{f.desc}</p>
				</article>
			{/each}
		</div>
	</section>

	<section class="closing fade-in">
		<div class="closing-glow" aria-hidden="true"></div>
		<h2>Your music. Your machine. Nothing else.</h2>
		<div class="closing-cta">
			<a class="download compact" href={MAC_DMG} download>
				<svg viewBox="0 0 24 24" width="18" height="18" aria-hidden="true"
					><path
						fill="currentColor"
						d="M16.365 1.43c0 1.14-.42 2.205-1.12 2.99c-.78.875-2.04 1.55-3.04 1.47c-.13-1.1.42-2.27 1.07-2.99c.74-.815 2.04-1.43 3.09-1.47M20.5 17.06c-.55 1.28-.82 1.85-1.53 2.98c-.99 1.58-2.38 3.54-4.1 3.55c-1.53.02-1.93-.99-4-.98c-2.07.01-2.5 1-4.04.97c-1.72-.01-3.04-1.78-4.03-3.36c-2.78-4.42-3.07-9.6-1.36-12.35c1.22-1.95 3.14-3.1 4.95-3.1c1.84 0 3 1 4.52 1c1.47 0 2.37-1 4.5-1c1.61 0 3.32.88 4.54 2.4c-3.99 2.18-3.34 7.88.55 9.29"
					/></svg
				>
				Download for Mac
			</a>
			<a class="ghost" href="/shortcuts">View keyboard shortcuts →</a>
		</div>
	</section>

	<footer>
		<span>created by <a href="https://github.com/saravenpi" target="_blank" rel="noopener">@saravenpi</a></span>
		<a href="https://github.com/saravenpi/waves" target="_blank" rel="noopener">source on github →</a>
	</footer>
</main>

<style>
	main {
		width: 100%;
		max-width: 1040px;
		margin: 0 auto;
		padding: 0 1.5rem 4rem;
	}

	/* ---------- top bar ---------- */
	.topbar {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 1.6rem 0;
		position: relative;
		z-index: 2;
	}
	.brand {
		display: inline-flex;
		align-items: center;
		gap: 0.6rem;
		color: var(--text-white);
	}
	.brand:hover {
		opacity: 1;
	}
	.brand-mark {
		width: 26px;
		height: 26px;
	}
	.brand-name {
		font-size: 1rem;
		letter-spacing: 0.28em;
		padding-left: 0.1em;
	}
	.topnav {
		display: flex;
		gap: 1.6rem;
		font-family: var(--mono);
		font-size: 0.8rem;
		letter-spacing: 0.05em;
	}
	.topnav a {
		color: var(--text-gray);
	}
	.topnav a:hover {
		color: var(--text-white);
		opacity: 1;
	}

	/* ---------- hero ---------- */
	.hero {
		position: relative;
		text-align: center;
		padding: 6rem 1rem 7rem;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.hero-glow {
		position: absolute;
		top: 8%;
		left: 50%;
		width: 620px;
		height: 620px;
		max-width: 110vw;
		transform: translateX(-50%);
		background: radial-gradient(circle, var(--accent-glow) 0%, transparent 62%);
		opacity: 0.5;
		filter: blur(20px);
		pointer-events: none;
		z-index: 0;
	}
	.hero > *:not(.hero-glow) {
		position: relative;
		z-index: 1;
	}

	.wordmark {
		font-size: clamp(3.2rem, 11vw, 6.5rem);
		line-height: 0.95;
		letter-spacing: 0.04em;
		font-weight: normal;
		margin-bottom: 1.4rem;
	}
	.tagline {
		font-size: clamp(1.15rem, 3.2vw, 1.7rem);
		color: var(--text-white);
		margin-bottom: 0.6rem;
	}
	.subtagline {
		font-family: var(--mono);
		font-size: 0.85rem;
		letter-spacing: 0.02em;
		color: var(--text-gray);
		max-width: 30rem;
		line-height: 1.6;
	}

	/* ---------- download cta ---------- */
	.cta {
		margin-top: 2.6rem;
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.download {
		display: inline-flex;
		align-items: center;
		gap: 0.85rem;
		padding: 1rem 2rem;
		background: var(--text-white);
		color: #000;
		border: 1px solid var(--text-white);
		letter-spacing: 0.02em;
		transition: transform 0.18s ease, box-shadow 0.25s ease, background 0.2s ease;
	}
	.download:hover {
		opacity: 1;
		transform: translateY(-2px);
		box-shadow: 0 0 0 1px var(--accent), 0 18px 50px -18px var(--accent-glow);
	}
	.download svg {
		flex-shrink: 0;
	}
	.download-text {
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		line-height: 1.15;
	}
	.download-main {
		font-size: 1.02rem;
	}
	.download-sub {
		font-family: var(--mono);
		font-size: 0.68rem;
		letter-spacing: 0.04em;
		color: #555;
	}
	.cta-note {
		font-family: var(--mono);
		font-size: 0.72rem;
		letter-spacing: 0.04em;
		color: var(--text-dim);
		margin-top: 1rem;
	}
	.other-toggle {
		margin-top: 1.6rem;
		background: transparent;
		border: none;
		color: var(--text-gray);
		font-family: var(--mono);
		font-size: 0.78rem;
		letter-spacing: 0.04em;
	}
	.other-toggle:hover {
		color: var(--text-white);
		transform: none;
	}
	.other-grid {
		margin-top: 1.2rem;
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		gap: 0.6rem;
		width: 100%;
		max-width: 560px;
	}
	.other-link {
		display: flex;
		flex-direction: column;
		gap: 0.3rem;
		padding: 0.85rem 1rem;
		border: 1px solid var(--line);
		color: var(--text-white);
		text-align: left;
		transition: border-color 0.2s ease, background 0.2s ease;
	}
	.other-link:hover {
		opacity: 1;
		border-color: var(--line-strong);
		background: var(--bg-elev);
	}
	.other-link.detected {
		border-color: var(--accent);
		background: var(--accent-dim);
	}
	.other-name {
		font-size: 0.9rem;
		display: flex;
		align-items: center;
		gap: 0.5rem;
	}
	.tag {
		font-family: var(--mono);
		font-size: 0.6rem;
		letter-spacing: 0.06em;
		text-transform: uppercase;
		color: var(--accent);
		border: 1px solid var(--accent);
		padding: 0.05rem 0.35rem;
		border-radius: 2px;
	}
	.other-detail {
		font-family: var(--mono);
		font-size: 0.7rem;
		letter-spacing: 0.03em;
		color: var(--text-gray);
	}

	/* ---------- features ---------- */
	.features {
		padding-top: 2rem;
		border-top: 1px solid var(--line);
	}
	.section-head {
		margin-bottom: 2.8rem;
	}
	.kicker {
		display: block;
		font-family: var(--mono);
		font-size: 0.74rem;
		letter-spacing: 0.18em;
		text-transform: uppercase;
		color: var(--accent);
		margin-bottom: 0.9rem;
	}
	.section-head h2 {
		font-size: clamp(1.6rem, 4vw, 2.4rem);
		font-weight: normal;
		letter-spacing: 0.01em;
		max-width: 24ch;
		line-height: 1.15;
	}
	.feature-grid {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		border-top: 1px solid var(--line);
		border-left: 1px solid var(--line);
	}
	.feature {
		padding: 2rem 1.8rem 2.2rem;
		border-right: 1px solid var(--line);
		border-bottom: 1px solid var(--line);
		transition: background 0.25s ease;
	}
	.feature:hover {
		background: var(--bg-elev);
	}
	.feature-label {
		font-family: var(--mono);
		font-size: 0.7rem;
		letter-spacing: 0.12em;
		text-transform: uppercase;
		color: var(--text-dim);
	}
	.feature h3 {
		font-size: 1.18rem;
		font-weight: normal;
		margin: 0.7rem 0 0.7rem;
		letter-spacing: 0.01em;
	}
	.feature p {
		font-family: var(--mono);
		font-size: 0.8rem;
		line-height: 1.65;
		color: var(--text-gray);
	}

	/* ---------- closing ---------- */
	.closing {
		position: relative;
		text-align: center;
		padding: 6rem 1rem 5rem;
		overflow: hidden;
	}
	.closing-glow {
		position: absolute;
		bottom: -40%;
		left: 50%;
		width: 700px;
		height: 500px;
		max-width: 120vw;
		transform: translateX(-50%);
		background: radial-gradient(circle, var(--accent-glow) 0%, transparent 65%);
		opacity: 0.4;
		filter: blur(30px);
		pointer-events: none;
	}
	.closing > *:not(.closing-glow) {
		position: relative;
		z-index: 1;
	}
	.closing h2 {
		font-size: clamp(1.6rem, 4.5vw, 2.6rem);
		font-weight: normal;
		letter-spacing: 0.01em;
		margin-bottom: 2rem;
	}
	.closing-cta {
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 1.6rem;
		flex-wrap: wrap;
	}
	.download.compact {
		padding: 0.85rem 1.6rem;
		gap: 0.6rem;
	}
	.ghost {
		font-family: var(--mono);
		font-size: 0.82rem;
		letter-spacing: 0.03em;
		color: var(--text-gray);
	}
	.ghost:hover {
		color: var(--text-white);
		opacity: 1;
	}

	/* ---------- footer ---------- */
	footer {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding-top: 2rem;
		border-top: 1px solid var(--line);
		font-family: var(--mono);
		font-size: 0.78rem;
		letter-spacing: 0.03em;
		color: var(--text-gray);
	}
	footer a {
		color: var(--text-white);
	}
	footer a:hover {
		color: var(--accent);
		opacity: 1;
	}

	/* ---------- fade-in ---------- */
	.fade-in {
		opacity: 0;
		animation: fadeIn 0.7s ease forwards;
	}
	.delay-1 {
		animation-delay: 0.12s;
	}
	.delay-2 {
		animation-delay: 0.24s;
	}
	.delay-3 {
		animation-delay: 0.36s;
	}
	@keyframes fadeIn {
		from {
			opacity: 0;
			transform: translateY(16px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	/* ---------- responsive ---------- */
	@media (max-width: 880px) {
		.feature-grid {
			grid-template-columns: repeat(2, 1fr);
		}
		.other-grid {
			grid-template-columns: 1fr;
		}
	}
	@media (max-width: 680px) {
		main {
			padding: 0 1.1rem 3rem;
		}
		.hero {
			padding: 3.5rem 0.5rem 4.5rem;
		}
		.feature-grid {
			grid-template-columns: 1fr;
		}
		.download {
			width: 100%;
			justify-content: center;
		}
		.cta {
			align-items: stretch;
		}
		.cta-note,
		.other-toggle {
			text-align: center;
		}
		footer {
			flex-direction: column;
			gap: 0.8rem;
			text-align: center;
		}
		.closing-cta {
			flex-direction: column;
			gap: 1.1rem;
		}
		.download.compact {
			width: 100%;
			justify-content: center;
		}
	}
</style>
