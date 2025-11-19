<script lang="ts">
	import { onMount } from 'svelte';

	type Platform = 'macos' | 'linux' | 'windows' | 'unknown';

	let detectedPlatform: Platform = 'unknown';
	let showAllDownloads = false;

	const downloads = {
		macos: {
			name: 'macOS',
			file: 'waves-macos.dmg',
			size: '7.1 MB',
			icon: '🍎'
		},
		linux: {
			name: 'Linux',
			file: 'waves-linux-x86_64.tar.gz',
			size: '9.4 MB',
			icon: '🐧'
		},
		windows: {
			name: 'Windows',
			file: 'waves-windows-x86_64.zip',
			size: '6.3 MB',
			icon: '💻'
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
		// Use GitHub releases for downloads
		return `https://github.com/saravenpi/waves/releases/latest/download/${file}`;
	}
</script>

<svelte:head>
	<title>WAVES - Audio Player</title>
	<meta name="description" content="A cross-platform GUI music player with real-time visualization" />
</svelte:head>

<main>
	<div class="container">
		<div class="header fade-in">
			<img src="/waves_logo.png" alt="WAVES Logo" class="logo" />
			<h1>WAVES</h1>
			<p class="tagline">cross-platform audio player</p>
		</div>

		<div class="downloads fade-in delay-1">
			{#if detectedPlatform !== 'unknown' && !showAllDownloads}
				<div class="primary-download">
					<a
						href={getDownloadUrl(downloads[detectedPlatform].file)}
						class="download-btn primary"
						download
					>
						<svg class="download-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M13 17V3h-2v10H9v-2H7v2h2v2h2v2zm8 2v-4h-2v4H5v-4H3v6h18zm-8-6v2h2v-2h2v-2h-2v2z"/></svg>
						<span class="btn-text">
							<span class="platform-name">{downloads[detectedPlatform].name}</span>
							<span class="file-size">{downloads[detectedPlatform].size}</span>
						</span>
					</a>
					<button class="show-all" on:click={() => (showAllDownloads = true)}>
						other platforms
					</button>
				</div>
			{:else}
				<div class="all-downloads">
					<div class="download-grid">
						{#each Object.entries(downloads) as [key, platform]}
							<a href={getDownloadUrl(platform.file)} class="download-btn" download>
								<svg class="download-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M13 17V3h-2v10H9v-2H7v2h2v2h2v2zm8 2v-4h-2v4H5v-4H3v6h18zm-8-6v2h2v-2h2v-2h-2v2z"/></svg>
								<span class="btn-text">
									<span class="platform-name">{platform.name}</span>
									<span class="file-size">{platform.size}</span>
								</span>
							</a>
						{/each}
					</div>
				</div>
			{/if}
		</div>

		<div class="info fade-in delay-2">
			<div class="info-section">
				<h3>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M9 2H5v2H3v2H1v6h2v2h2v2h2v2h2v2h2v2h2v-2h2v-2h2v-2h2v-2h2v-2h2V6h-2V4h-2V2h-4v2h-2v2h-2V4H9zm0 2v2h2v2h2V6h2V4h4v2h2v6h-2v2h-2v2h-2v2h-2v2h-2v-2H9v-2H7v-2H5v-2H3V6h2V4z"/></svg>
					<span>features</span>
				</h3>
				<ul>
					<li>miller column file browser</li>
					<li>4 visualization modes (spectrum, waveform, circle, agbe)</li>
					<li>agbe: psychedelic music-reactive visualization</li>
					<li>fft-based spectrum analyzer (64 bands)</li>
					<li>waveform display with playback progress</li>
					<li>mp3, wav, flac, ogg, m4a support</li>
					<li>metadata editing with cover preservation</li>
					<li>favorites system</li>
					<li>vim-style navigation (h/j/k/l)</li>
					<li>cross-platform (macos/linux/windows)</li>
				</ul>
			</div>
		</div>

		<div class="shortcuts-link-section fade-in delay-3">
			<a href="/shortcuts" class="shortcuts-link">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M12 1h2v8h8v4h-2v-2h-8V5h-2V3h2zM8 7V5h2v2zM6 9V7h2v2zm-2 2V9h2v2zm10 8v2h-2v2h-2v-8H2v-4h2v2h8v6zm2-2v2h-2v-2zm2-2v2h-2v-2zm0 0h2v-2h-2z"/></svg>
				<span>view keyboard shortcuts</span>
			</a>
		</div>

		<footer class="fade-in delay-4">
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
	}

	.logo {
		width: 100px;
		height: 100px;
		margin-bottom: 1rem;
	}

	h1 {
		font-size: 2.5rem;
		letter-spacing: 0.3rem;
		margin-bottom: 0.5rem;
		color: var(--text-white);
		font-weight: normal;
	}

	.tagline {
		color: var(--text-gray);
		font-size: 0.85rem;
		letter-spacing: 0.05rem;
	}

	.downloads {
		margin-bottom: 3rem;
	}

	.primary-download {
		text-align: center;
	}

	.download-btn {
		display: inline-flex;
		align-items: center;
		gap: 0.5rem;
		padding: 0.75rem 2rem;
		background-color: transparent;
		border: 1px solid var(--text-white);
		color: var(--text-white);
		font-size: 0.9rem;
		border-radius: 0;
		margin: 0.5rem;
		transition: all 0.15s ease;
		text-transform: lowercase;
	}

	.download-btn:hover {
		background-color: var(--text-white);
		color: #000;
	}

	.download-btn.primary {
		font-size: 1rem;
		padding: 1rem 2.5rem;
		border: 1px solid var(--text-white);
	}

	.download-icon {
		display: flex;
		flex-shrink: 0;
	}

	.btn-text {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 0.25rem;
	}

	.platform-name {
		font-size: inherit;
	}

	.file-size {
		font-size: 0.75rem;
		color: var(--text-gray);
	}

	.show-all {
		display: block;
		margin: 1.5rem auto 0;
		background: transparent;
		border: none;
		color: var(--text-gray);
		padding: 0.5rem 1rem;
		font-size: 0.85rem;
		text-decoration: underline;
		cursor: pointer;
	}

	.show-all:hover {
		color: var(--text-white);
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
		margin-bottom: 3rem;
		max-width: 600px;
		margin-left: auto;
		margin-right: auto;
	}

	.info-section {
		padding: 0;
	}

	.info-section h3 {
		display: flex;
		align-items: center;
		gap: 0.5rem;
		color: var(--text-white);
		margin-bottom: 1rem;
		letter-spacing: 0.1rem;
		font-size: 0.9rem;
		text-transform: lowercase;
	}

	.info-section h3 svg {
		flex-shrink: 0;
	}

	.info-section ul {
		list-style: none;
		padding-left: 0;
	}

	.info-section li {
		padding: 0.4rem 0;
		color: var(--text-gray);
		font-size: 0.9rem;
	}

	.info-section li::before {
		content: '- ';
		margin-right: 0.5rem;
	}

	.shortcuts-link-section {
		text-align: center;
		margin-bottom: 3rem;
	}

	.shortcuts-link {
		display: inline-flex;
		align-items: center;
		gap: 0.5rem;
		color: var(--text-white);
		font-size: 0.9rem;
		text-decoration: underline;
		text-transform: lowercase;
	}

	.shortcuts-link:hover {
		color: var(--text-gray);
	}

	.shortcuts-link svg {
		flex-shrink: 0;
	}

	footer {
		text-align: center;
		padding: 3rem 0 2rem;
		color: var(--text-gray);
	}

	footer p {
		margin: 0.5rem 0;
	}

	.source-link {
		font-size: 0.85rem;
		text-decoration: underline;
	}

	.source-link:hover {
		color: var(--text-white);
	}

	.fade-in {
		opacity: 0;
		animation: fadeIn 0.8s ease forwards;
	}

	.delay-1 {
		animation-delay: 0.2s;
	}

	.delay-2 {
		animation-delay: 0.4s;
	}

	.delay-3 {
		animation-delay: 0.6s;
	}

	.delay-4 {
		animation-delay: 0.8s;
	}

	@keyframes fadeIn {
		from {
			opacity: 0;
			transform: translateY(15px);
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
