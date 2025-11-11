<script lang="ts">
	import { onMount } from 'svelte';

	type Platform = 'macos' | 'linux' | 'windows' | 'unknown';

	let detectedPlatform: Platform = 'unknown';
	let showAllDownloads = false;

	const downloads = {
		macos: {
			name: 'macOS',
			file: 'waves-macos.dmg',
			size: '6.6 MB',
			icon: '🍎'
		},
		linux: {
			name: 'Linux',
			file: 'waves-linux-x86_64.tar.gz',
			size: '5.8 MB',
			icon: '🐧'
		},
		windows: {
			name: 'Windows',
			file: 'waves-windows-x86_64.zip',
			size: '5.9 MB',
			icon: '🪟'
		}
	};

	onMount(() => {
		const userAgent = navigator.userAgent.toLowerCase();
		const platform = navigator.platform?.toLowerCase() || '';

		if (userAgent.includes('mac') || platform.includes('mac')) {
			detectedPlatform = 'macos';
		} else if (userAgent.includes('linux') || platform.includes('linux')) {
			detectedPlatform = 'linux';
		} else if (userAgent.includes('win') || platform.includes('win')) {
			detectedPlatform = 'windows';
		}
	});

	function getDownloadUrl(file: string): string {
		return `/downloads/${file}`;
	}
</script>

<svelte:head>
	<title>WAVES - Audio Player</title>
	<meta name="description" content="A cross-platform GUI music player with real-time visualization" />
</svelte:head>

<main>
	<div class="container">
		<div class="header">
			<img src="/waves_logo.png" alt="WAVES Logo" class="logo" />
			<h1>WAVES</h1>
			<p class="tagline">cross-platform audio player</p>
		</div>

		<div class="screenshot">
			<img src="/waves_demo.png" alt="WAVES Demo" />
		</div>

		<div class="features">
			<div class="feature">
				<span class="icon">📁</span>
				<span>miller column browser</span>
			</div>
			<div class="feature">
				<span class="icon">📊</span>
				<span>real-time visualization</span>
			</div>
			<div class="feature">
				<span class="icon">🎵</span>
				<span>multiple formats</span>
			</div>
			<div class="feature">
				<span class="icon">⌨️</span>
				<span>vim keybindings</span>
			</div>
		</div>

		<div class="downloads">
			{#if detectedPlatform !== 'unknown' && !showAllDownloads}
				<div class="primary-download">
					<p class="detected">detected: {downloads[detectedPlatform].name}</p>
					<a
						href={getDownloadUrl(downloads[detectedPlatform].file)}
						class="download-btn primary"
						download
					>
						<span class="btn-icon">{downloads[detectedPlatform].icon}</span>
						<span class="btn-text">
							download for {downloads[detectedPlatform].name}
							<span class="size">({downloads[detectedPlatform].size})</span>
						</span>
					</a>
					<button class="show-all" on:click={() => (showAllDownloads = true)}>
						show all downloads
					</button>
				</div>
			{:else}
				<div class="all-downloads">
					<h2>download</h2>
					<div class="download-grid">
						{#each Object.entries(downloads) as [key, platform]}
							<a href={getDownloadUrl(platform.file)} class="download-btn" download>
								<span class="btn-icon">{platform.icon}</span>
								<span class="btn-text">
									{platform.name}
									<span class="size">({platform.size})</span>
								</span>
							</a>
						{/each}
					</div>
				</div>
			{/if}
		</div>

		<div class="info">
			<div class="info-section">
				<h3>features</h3>
				<ul>
					<li>miller column file browser</li>
					<li>fft-based spectrum analyzer (64 bands)</li>
					<li>waveform display with playback progress</li>
					<li>mp3, wav, flac, ogg, m4a support</li>
					<li>metadata editing for all formats</li>
					<li>favorites system</li>
					<li>vim-style navigation (h/j/k/l)</li>
					<li>cross-platform (macos/linux/windows)</li>
				</ul>
			</div>

			<div class="info-section">
				<h3>keyboard shortcuts</h3>
				<div class="shortcuts">
					<div class="shortcut-group">
						<p class="group-title">navigation:</p>
						<code>h/j/k/l</code> - navigate
						<code>enter/l</code> - select/play
						<code>tab</code> - cycle views
					</div>
					<div class="shortcut-group">
						<p class="group-title">playback:</p>
						<code>space</code> - pause/resume
						<code>←/→</code> - prev/next track
						<code>↑/↓</code> - volume
					</div>
					<div class="shortcut-group">
						<p class="group-title">file operations:</p>
						<code>y</code> - yank (copy)
						<code>x</code> - cut
						<code>p</code> - paste
						<code>r</code> - rename
						<code>d</code> - delete
						<code>n</code> - new folder
					</div>
				</div>
			</div>
		</div>

		<footer>
			<p>
				created by <a href="https://github.com/saravenpi" target="_blank" rel="noopener"
					>@saravenpi</a
				>
			</p>
			<p>
				<a
					href="https://github.com/saravenpi/waves"
					target="_blank"
					rel="noopener"
					class="source-link">view source on github →</a
				>
			</p>
		</footer>
	</div>
</main>

<style>
	main {
		width: 100%;
		min-height: 100vh;
		display: flex;
		justify-content: center;
		padding: 2rem 1rem;
	}

	.container {
		max-width: 900px;
		width: 100%;
	}

	.header {
		text-align: center;
		margin-bottom: 3rem;
		animation: fadeIn 0.6s ease;
	}

	.logo {
		width: 120px;
		height: 120px;
		margin-bottom: 1rem;
	}

	h1 {
		font-size: 3rem;
		letter-spacing: 0.5rem;
		margin-bottom: 0.5rem;
		color: var(--primary-color);
	}

	.tagline {
		color: var(--text-gray);
		font-size: 0.9rem;
		letter-spacing: 0.1rem;
	}

	.screenshot {
		margin-bottom: 3rem;
		border: 1px solid var(--text-gray);
		border-radius: 4px;
		overflow: hidden;
		animation: fadeIn 0.8s ease 0.2s both;
	}

	.screenshot img {
		width: 100%;
		height: auto;
		display: block;
	}

	.features {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
		gap: 1.5rem;
		margin-bottom: 3rem;
		animation: fadeIn 0.8s ease 0.4s both;
	}

	.feature {
		display: flex;
		align-items: center;
		gap: 0.75rem;
		padding: 1rem;
		border: 1px solid var(--text-gray);
		border-radius: 4px;
		transition: border-color 0.2s ease;
	}

	.feature:hover {
		border-color: var(--primary-color);
	}

	.feature .icon {
		font-size: 1.5rem;
	}

	.downloads {
		margin-bottom: 3rem;
		animation: fadeIn 0.8s ease 0.6s both;
	}

	.primary-download {
		text-align: center;
	}

	.detected {
		color: var(--text-gray);
		font-size: 0.85rem;
		margin-bottom: 1rem;
	}

	.download-btn {
		display: inline-flex;
		align-items: center;
		gap: 0.75rem;
		padding: 1rem 2rem;
		background-color: transparent;
		border: 2px solid var(--primary-color);
		color: var(--text-white);
		font-size: 1rem;
		border-radius: 4px;
		margin: 0.5rem;
		transition: all 0.2s ease;
	}

	.download-btn:hover {
		background-color: var(--primary-color);
		transform: translateY(-2px);
		box-shadow: 0 4px 12px rgba(150, 100, 255, 0.3);
	}

	.download-btn.primary {
		font-size: 1.1rem;
		padding: 1.25rem 2.5rem;
	}

	.btn-icon {
		font-size: 1.5rem;
	}

	.btn-text {
		display: flex;
		flex-direction: column;
		align-items: flex-start;
	}

	.size {
		font-size: 0.75rem;
		color: var(--text-gray);
		margin-top: 0.25rem;
	}

	.show-all {
		display: block;
		margin: 1.5rem auto 0;
		background: transparent;
		border: 1px solid var(--text-gray);
		color: var(--text-gray);
		padding: 0.5rem 1rem;
		font-size: 0.85rem;
		border-radius: 4px;
	}

	.show-all:hover {
		border-color: var(--text-white);
		color: var(--text-white);
	}

	.all-downloads h2 {
		text-align: center;
		margin-bottom: 1.5rem;
		color: var(--primary-color);
		letter-spacing: 0.2rem;
	}

	.download-grid {
		display: flex;
		flex-direction: column;
		gap: 1rem;
		max-width: 500px;
		margin: 0 auto;
	}

	.download-grid .download-btn {
		width: 100%;
		justify-content: center;
	}

	.info {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		gap: 2rem;
		margin-bottom: 3rem;
		animation: fadeIn 0.8s ease 0.8s both;
	}

	.info-section {
		border: 1px solid var(--text-gray);
		padding: 1.5rem;
		border-radius: 4px;
	}

	.info-section h3 {
		color: var(--primary-color);
		margin-bottom: 1rem;
		letter-spacing: 0.1rem;
	}

	.info-section ul {
		list-style: none;
		padding-left: 0;
	}

	.info-section li {
		padding: 0.5rem 0;
		border-bottom: 1px solid #222;
	}

	.info-section li:last-child {
		border-bottom: none;
	}

	.info-section li::before {
		content: '→ ';
		color: var(--primary-color);
		margin-right: 0.5rem;
	}

	.shortcuts {
		display: flex;
		flex-direction: column;
		gap: 1rem;
	}

	.shortcut-group {
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
	}

	.group-title {
		color: var(--text-gray);
		font-size: 0.85rem;
		margin-bottom: 0.25rem;
	}

	code {
		background-color: #111;
		color: var(--primary-color);
		padding: 0.25rem 0.5rem;
		border-radius: 2px;
		font-family: 'gohu', monospace;
		font-size: 0.85rem;
		display: inline-block;
		margin-right: 0.5rem;
	}

	footer {
		text-align: center;
		padding: 2rem 0;
		border-top: 1px solid var(--text-gray);
		color: var(--text-gray);
		animation: fadeIn 0.8s ease 1s both;
	}

	footer p {
		margin: 0.5rem 0;
	}

	.source-link {
		font-size: 0.9rem;
	}

	@keyframes fadeIn {
		from {
			opacity: 0;
			transform: translateY(20px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	@media (max-width: 768px) {
		h1 {
			font-size: 2rem;
			letter-spacing: 0.3rem;
		}

		.logo {
			width: 80px;
			height: 80px;
		}

		.features {
			grid-template-columns: 1fr;
		}

		.info {
			grid-template-columns: 1fr;
		}

		.download-btn {
			font-size: 0.9rem;
			padding: 0.85rem 1.5rem;
		}

		.download-btn.primary {
			font-size: 1rem;
			padding: 1rem 1.75rem;
		}
	}
</style>
