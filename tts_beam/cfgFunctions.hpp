class tts_beam
{
	class beam
	{
		file = "\tts_beam\functions";
		class beam {};
		class rayParticles {};
		class ragdollUnit {};
		class explosionDamage {};
		class explosionParticles {};
		class postProcessEffects {};
		class customZeusModules {
			preInit = 1; // register zeus modules on mission start
		};
	};
	class modules
	{
		file = "\tts_beam\functions\modules";
		class moduleBeamStrike {};
	};
};