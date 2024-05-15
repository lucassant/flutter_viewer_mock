package br.com.xpinc.investments.investmentoptions.home.presentation

import android.os.Bundle
import br.com.xpinc.investments.investmentoptions.R
import br.com.xpinc.investments.investmentoptions.databinding.ActivityInvestmentOptionsBinding
import br.com.xpinc.investments.investmentoptions.home.presentation.fragments.LegacyShelfFragment
import br.com.xpinc.mobile.commons.base.BaseMvvmActivity
import br.com.xpinc.mobile.commons.extensions.TransitionAnimation
import br.com.xpinc.mobile.commons.extensions.replace
import br.com.xpinc.mobile.commons.flutter.crossing.FlutterCrossingManager
import br.com.xpinc.mobile.commons.livedata.SafeObserver
import br.com.xpinc.viewbinding.viewBinding
import com.xpinc.soma.utils.hide
import javax.inject.Inject

class InvestmentOptionsActivity : BaseMvvmActivity() {

    private val binding by viewBinding(ActivityInvestmentOptionsBinding::inflate)
    private val vm by appViewModel<InvestmentsOptionsViewModel>()

    private val selectedTab by lazy {
        intent.data?.getQueryParameter("selectedTab").orEmpty()
    }

    @Inject
    lateinit var flutterCrossingManager: FlutterCrossingManager

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(binding.root)
        setupObservables()
        setupToolbar()
    }

    private fun setupObservables() {
        vm.showFlutterVersion.observe(this, SafeObserver { isShelfFlutterEnabled ->
            if (isShelfFlutterEnabled) {
                binding.toolbar.hide()
                val route = FLUTTER_SHELF.format(selectedTab)
                flutterCrossingManager.crossToFlutter(this, route)
                finish()
            } else {
                setupToolbar()
                showLegacyShelf()
            }
        })
    }

    private fun setupToolbar() {
        binding.toolbar.apply {
            setSupportActionBar(this)
            setBackEnabled(this@InvestmentOptionsActivity, true)
            setNavigationOnClickListener { onBackPressed() }
            this@InvestmentOptionsActivity.title = getString(R.string.title_toolbar)
        }
    }

    private fun showLegacyShelf() {
        supportFragmentManager.replace(
            id = R.id.inv_shelf_fragment,
            fragment = LegacyShelfFragment.newInstance(),
            tag = "LegacyShelfFragment",
            addStack = false,
            transitionAnimation = TransitionAnimation.FadeAnim
        )
    }

    private companion object {
        val FLUTTER_SHELF = "/investments/products_shelf?selectedTab=$selectedTab"
    }
}
