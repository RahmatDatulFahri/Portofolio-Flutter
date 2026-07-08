import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Catatan: karena hosting statis (GitHub Pages) tidak punya backend,
      // form ini perlu dihubungkan ke layanan seperti Formspree atau
      // EmailJS agar pesan benar-benar terkirim. Untuk sekarang, ini
      // membuka aplikasi email default sebagai fallback sederhana.
      final subject = Uri.encodeComponent('Pesan dari Portfolio - ${_nameController.text}');
      final body = Uri.encodeComponent(
        'Nama: ${_nameController.text}\nEmail: ${_emailController.text}\n\n${_messageController.text}',
      );
      _openUrl('mailto:${PortfolioData.email}?subject=$subject&body=$body');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;

    return SectionWrapper(
      showBottomDivider: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '06/06', title: "LET'S WORK TOGETHER"),
          const SizedBox(height: AppSpacing.lg),
          isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContactInfo()),
        const SizedBox(width: AppSpacing.xl),
        Expanded(child: _buildForm()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactInfo(),
        const SizedBox(height: AppSpacing.lg),
        _buildForm(),
      ],
    );
  }

  Widget _buildContactInfo() {
    Widget infoLine(String label, String value, {String? url}) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: InkWell(
          onTap: url != null ? () => _openUrl(url) : null,
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
              children: [
                TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.w400)),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoLine('Email', PortfolioData.email, url: 'mailto:${PortfolioData.email}'),
        infoLine('Phone', PortfolioData.phone),
        infoLine('Location', PortfolioData.location),
        infoLine('GitHub', PortfolioData.github, url: PortfolioData.githubUrl),
        infoLine('LinkedIn', PortfolioData.linkedin, url: PortfolioData.linkedinUrl),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildField('NAME', 'Your name', _nameController),
          const SizedBox(height: AppSpacing.md),
          _buildField('EMAIL', 'your@email.com', _emailController, isEmail: true),
          const SizedBox(height: AppSpacing.md),
          _buildField('MESSAGE', 'Tell me about your app', _messageController, maxLines: 3),
          const SizedBox(height: AppSpacing.md),
          ElevatedButton(
            onPressed: _handleSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              elevation: 0,
            ),
            child: Text('SEND MESSAGE', style: AppTextStyles.button.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildField(
    String label,
    String hint,
    TextEditingController controller, {
    bool isEmail = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: AppTextStyles.body,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          validator: (value) {
            if (value == null || value.trim().isEmpty) return 'Wajib diisi';
            if (isEmail && !value.contains('@')) return 'Email tidak valid';
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodySecondary,
            border: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.borderLight)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.borderLight)),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ],
    );
  }
}
