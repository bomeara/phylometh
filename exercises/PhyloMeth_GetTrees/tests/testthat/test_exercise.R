test_that("BiSSE_HiSSE_test",{
	library(diversitree)
	pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
	set.seed(4)
	phy <- tree.bisse(pars, max.t=30, x0=0)
	lik <- make.bisse(phy, phy$tip.state)
	diversitree.full <- lik(pars)
	
	hidden.states=FALSE
	states <- data.frame(phy$tip.state, phy$tip.state, row.names=names(phy$tip.state))
	states <- states[phy$tip.label,]
	pars.bisse <- c(0.1+0.03, 0.2+0.03, 0, 0, 0.03/0.1, 0.03/0.2, 0, 0, 0.01, 0, 0, 0.01, 0, 0, 0, 0, 0, 0, 0, 0)
	model.vec = c(pars.bisse, rep(1,36))
	phy$node.label = NULL
	cache = hisse:::ParametersToPass(phy, states[,1], model.vec, f=c(1,1), timeslice=NULL, hidden.states=hidden.states) 
	cache$turnover.beta.factor0 = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factor0 = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factor1 = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factor1 = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factorA = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factorA = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factorB = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factorB = 1 / dbeta(0.1, 1, 1)
	hisse.full <- hisse:::DownPass(phy, cache, hidden.states=TRUE, root.type="madfitz", condition.on.survival=TRUE)
	comparison <- identical(round(hisse.full,4), round(diversitree.full,4))
	expect_true(comparison)
})


test_that("MuSSE_HiSSE_test1", {
	library(diversitree)
	pars <- c(.1,  .15,  .2,  # lambda 1, 2, 3
			  .03, .045, .06, # mu 1, 2, 3
			  .05, 0,         # q12, q13
			  .05, .05,       # q21, q23
			  0,   .05)       # q31, q32
	set.seed(2)
	phy <- tree.musse(pars, 30, x0=1)
	states <- phy$tip.state
	lik <- make.musse(phy, states, 3)
	lik.base <- constrain(lik, lambda2 ~ lambda1, lambda3 ~ lambda1,
						  mu2 ~ mu1, mu3 ~ mu1,
						  q13 ~ 0, q21 ~ q12, q23 ~ q12, q31 ~ 0, q32 ~ q12)
	diversitree.constrained = lik.base(c(.1, .03, .05))
	diversitree.full = lik(pars)
	
	hidden.states="TEST"
	states <- data.frame(phy$tip.state, phy$tip.state, row.names=names(phy$tip.state))
	states <- states[phy$tip.label,]
	states[states[,1]==3,] = 4
	pars.hisse <- c(0.1+0.03, 0.1+0.03, 0, 0.1+0.03, 0.03/0.1, 0.03/0.1, 0, 0.03/0.1, 0.05, 0, 0, 0.05, 0, 0.05,0, 0, 0, 0, 0.05, 0)
	model.vec = c(pars.hisse, rep(1,36))
	phy$node.label = NULL
	cache = hisse:::ParametersToPass(phy, states[,1], model.vec, f=c(1,1), timeslice=NULL, hidden.states=hidden.states) 
	cache$turnover.beta.factor0 = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factor0 = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factor1 = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factor1 = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factorA = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factorA = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factorB = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factorB = 1 / dbeta(0.1, 1, 1)
	hisse.constrained <- hisse:::DownPass(phy, cache, hidden.states=TRUE, root.type="madfitz", condition.on.survival=TRUE)
	comparison <- identical(round(hisse.constrained,4), round(diversitree.constrained,4))
	expect_true(comparison)
})

test_that("MuSSE_HiSSE_test2", {
	library(diversitree)
	pars <- c(.1,  .15,  .2,  # lambda 1, 2, 3
			  .03, .045, .06, # mu 1, 2, 3
			  .05, 0,         # q12, q13
			  .05, .05,       # q21, q23
			  0,   .05)       # q31, q32
	set.seed(2)
	phy <- tree.musse(pars, 30, x0=1)
	states <- phy$tip.state
	lik <- make.musse(phy, states, 3)
	diversitree.full = lik(pars)
	
	hidden.states="TEST"
	states <- data.frame(phy$tip.state, phy$tip.state, row.names=names(phy$tip.state))
	states <- states[phy$tip.label,]
	states[states[,1]==3,] = 4
	pars.hisse <- c(0.1+0.03, 0.15+0.045, 0, 0.2+0.06, 0.03/0.1, 0.045/0.15, 0, 0.06/0.2, 0.05, 0, 0, 0.05, 0, 0.05,0, 0, 0, 0, 0.05, 0)
	model.vec = c(pars.hisse, rep(1,36))
	phy$node.label = NULL
	cache = hisse:::ParametersToPass(phy, states[,1], model.vec, f=c(1,1), timeslice=NULL, hidden.states=hidden.states) 
	cache$turnover.beta.factor0 = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factor0 = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factor1 = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factor1 = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factorA = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factorA = 1 / dbeta(0.1, 1, 1)
	cache$turnover.beta.factorB = 1 / dbeta(0.1, 1, 1)
	cache$eps.beta.factorB = 1 / dbeta(0.1, 1, 1)
	hisse.full <- hisse:::DownPass(phy, cache, hidden.states=TRUE, root.type="madfitz", condition.on.survival=TRUE)
	comparison <- identical(round(hisse.full,4), round(diversitree.full,4))
	expect_true(comparison)
})

test_that("HiSSE_Null_Four_test", {
	library(diversitree)
	pars <- c(0.1, 0.1, 0.03, 0.03, 0.01, 0.01)
	set.seed(4)
	phy <- tree.bisse(pars, max.t=30, x0=0)
	lik <- make.bisse(phy, phy$tip.state)
	diversitree.full <- lik(pars)
	
	states <- data.frame(phy$tip.state, phy$tip.state, row.names=names(phy$tip.state))
	states <- states[phy$tip.label,]
	pars.hisse.null <- c(rep(0.1+0.03,8), rep(0.03/.1, 8), rep(0.01, 32))
	model.vec = pars.hisse.null
	phy$node.label = NULL
	cache = hisse:::ParametersToPassNull(phy, states[,1], model.vec, f=c(1,1)) 
	hisse.full <- hisse:::DownPassNull(phy, cache, root.type="madfitz", condition.on.survival=TRUE)
	comparison <- identical(round(hisse.full,4), round(diversitree.full,4))
	expect_true(comparison)
})

